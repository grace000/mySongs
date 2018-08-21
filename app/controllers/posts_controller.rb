class PostsController < ApplicationController

	before_action :require_login 

	def index
		@posts = current_user.posts.order(created_at: :desc)
	end

	def new 
		@post = current_user.posts.build
	end

	def show
		@post = current_user.posts.find(params[:id])
	end

	def create
		#Post represents the model
		@post = current_user.posts.build(post_params)

		if @post.save
			#redirect to post which will load the show view
			redirect_to posts_path, notice: "Song info stored!" 
		else
			@errors = @post.errors.full_messages
			render :new
		end
	end

	def edit
		@post = current_user.posts.find(params[:id])
	end

	def update 
		@post = current_user.posts.find(params[:id])

		if(@post.update(post_params))
			#redirect to post which will load the show view
			redirect_to post_path, notice: "Song info updated!"
		else
			render :edit
		end
	end

	def destroy
		post = current_user.posts.find(params[:id])
		post.destroy
		redirect_to posts_path, notice: "Song info deleted!"
	end

	private def post_params
		params.require(:post).permit(:title, :url, :artist)
	end 
end
