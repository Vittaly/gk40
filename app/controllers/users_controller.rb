# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  def index
  end

  def show
  	  redirect_to signin_path unless signed_in?
    @user =  User.find(params[:id])
  end
  def new
	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
    	sign_in @user
      flash[:success] = 'Пользователь успешно создан!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
