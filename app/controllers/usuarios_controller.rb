class UsuariosController < ApplicationController
	before_action :set_user
	before_action :authenticate_user!, only: [:update]
	before_action :authenticate_ower!, only: [:update]

	def show
		@are_friends = current_user.my_friend?(@user)
	end

	def update
		respond_to do |format|
			if @user.update(user_params)
				format.html{redirect_to @user}
				format.json{render :show}
				format.js
			else
				format.html{redirect_to @user, notice: @user.errors.full_messages}
				format.json{render json: @user.errors}
			end
		end
	end

	private
		def set_user
			@user = User.find(params[:id])
		end

		def authenticate_ower!
			if current_user != @user
				redirect_to root_path, notice: "no estas autorizado para realizar esta accion", status: :unauthorized
			end
		end

		def user_params
			params.require(:user).permit(:email,:username,:name,:last_name,:bio, :avatar, :cover)
		end

end