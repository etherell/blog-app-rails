class UsersController < ApplicationController

	# Действие для создания формы регистрации sign up
	def new
		@user = User.new
	end

	# Действие в форме sign up, которое создаёт пользователя
	def create  
		@user = User.new(user_params)
		if @user.save
			redirect_to login_path
		else
			redirect_to '/signup'
		end
	end

	# Действие которое выводит страничку определенного пользователя
	def show 
		@user = User.find(params[:id])	
	end

	# Приватное действие которое получает параметры пользователя
	private
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end
