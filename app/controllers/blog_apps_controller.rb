class BlogAppsController < ApplicationController
  before_action :set_blog_app, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %w[index recent show]
  before_action :correct_user, only: %w[edit update destroy]

  # GET /blog_apps or /blog_apps.json
  def index
    @blog_apps = BlogApp.all
    @profile = Profile.find_by(user_id: current_user) if current_user
  end

  def my_blogs
    @blog_apps = BlogApp.where(user_id: current_user.id)
    redirect_to my_blogs_path, warning: 'You have not written any blog yet' if @blog_apps.nil?
  end

  def share_blog
    ShareMailer.with(input_email: params[:friend_email], url: params[:url],
                     sender: params[:sender]).share_blog.deliver_now
    redirect_to blog_apps_path, success: "Shared successfully to: #{params[:friend_email]}"
  end

  def recent
    @blog_apps = BlogApp.all.last(3).reverse
  end

  # GET /blog_apps/1 or /blog_apps/1.json
  def show; end

  # GET /blog_apps/new
  def new
    @profile = Profile.find_by(user_id: current_user)
    @blog_app = BlogApp.new
  end

  # GET /blog_apps/1/edit
  def edit
    @profile = Profile.find_by(user_id: current_user) if current_user
  end

  # POST /blog_apps or /blog_apps.json
  def create
    @blog_app = BlogApp.new(blog_app_params)

    respond_to do |format|
      if @blog_app.save
        format.html { redirect_to @blog_app, success: 'Blog app was successfully created.' }
        format.json { render :show, status: :created, location: @blog_app }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog_apps/1 or /blog_apps/1.json
  def update
    respond_to do |format|
      if @blog_app.update(blog_app_params)
        format.html { redirect_to @blog_app, success: 'Blog app was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog_app }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_apps/1 or /blog_apps/1.json
  def destroy
    @blog_app.destroy
    respond_to do |format|
      format.html { redirect_to blog_apps_url, success: 'Blog app was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # find correct user who can modify its written by him
  def correct_user
    @blog_app = current_user.blog_apps.find_by(id: params[:id])
    if @blog_app.nil?
      redirect_to blog_app_path(params[:id]),
                  danger: 'You are not authorize to edit this blog!'
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_blog_app
    @blog_app = BlogApp.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def blog_app_params
    params.require(:blog_app).permit(:title, :body, :author, :image, :user_id, :friend_email, :url, :sender)
  end
end
