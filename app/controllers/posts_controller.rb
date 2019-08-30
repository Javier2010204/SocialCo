class PostsController < ApplicationController
	before_action :set_post, except:[:index,:new,:create]
	def index
		@posts = Post.all_for_user(current_user).nuevos.paginate(page:1,per_page:5)
	end

	def show
		@comments = @post.comments
		@comment = current_user.comments.new
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.new(post_params)

		respond_to do |format|
			if @post.save
				format.js
				format.html {redirect_to @post, notice: "El post fue creado correctamente"}
				format.json{render :show, status: :created, location: @post}
			else
				format.html {render :new, notice: "No se pudo crear el post, intenta mas tarde"}
				format.json{render json: @post.errors, status: :unprocessable_entity}
			end
		end
	end

	def edit

	end

	def update
		respond_to do |format|
			if @post.update(post_params)
				format.html{redirect_to @post, notice: "El post fue actualizado correctamente"}
				format.json{render :show, status: :ok, location: @post}
			else
				format.html{render :edit}
				format.json{render json: @post.errors, status: :unprocessable_entity}
			end
		end
	end

	def destroy
		@post.destroy
		respond_to do |format|
			format.html{redirect_to posts_url, notice: "El post fue eliminado"}
			format.json{head :no_content}
		end
	end

	private
		def post_params
			params.require(:post).permit(:body, :image_post)
		end

		def set_post
			@post = Post.find(params[:id])
		end
end
