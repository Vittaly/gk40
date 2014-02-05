# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  def index
	  @apartments = Apartment.all :order => "apartment_number ASC"
  end

  def show
  	  redirect_to signin_path unless signed_in?
    @user =  User.find(params[:id])
	@apartment_counters = @user.apartment.apartment_counters
	
	#создаем новые месяцы, если если их нет
	if @user.apartment.monthly_readings.empty? then
		newmr = @user.apartment.monthly_readings.new month: Date.today
		newmr.save;
	else
	#проверяем что есть за текущий месяц
	last = @user.apartment.monthly_readings.last;
	last = last.next while last.next;
	end
	if !last.curent_month? then
	last = @user.apartment.monthly_readings.new month: Date.today;
	last.save	
	end
	@monthly_readings = @user.apartment.monthly_readings.find :all, :limit => 6
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
