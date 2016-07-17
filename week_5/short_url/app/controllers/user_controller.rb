class UserController < ApplicationController

  def index
    @url = User.new

    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    if @user.url.include? "http"
      redirect_to @user.url
    else
      redirect_to "http://#{@user.url}"
    end
  end

  def create
     @save = User.new(url: params[:url])
     @save.save
     redirect_to root_path
  end


end
