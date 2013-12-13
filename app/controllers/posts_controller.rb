class PostsController < ApplicationController
before_filter :authorise, :only => [:create, :destroy]
 
	def create
		@movie = Movie.find params[:movie_id]
		@post = @movie.posts.create params[:post]
		@post.user_id = @current_user.id
		
		  @post.save
			User.setRegular(@post.user)
		 
		 
		respond_to do |format|
			format.js 
			format.html{redirect_to @movie}
		end
	end

	def destroy
		@movie = Movie.find(params[:movie_id])
		@post = Post.find(params[:id])
		@post.destroy
		
		respond_to do|format|
			format.html{redirect_to @movie }
		
		end
	
	end
end