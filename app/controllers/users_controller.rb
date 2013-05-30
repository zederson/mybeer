#encoding: utf-8

class UsersController < ApplicationController

  def index
    @users = User.order(:name)
  end

  def create
    @user = User.new user_params

    if @user.save
      redirect_to(users_url, :notice => "Usuário #{@user.name} Criado Com Sucesso !!!")
    else
      render :action => "new"
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to(users_url, :notice => "Usuário #{@user.name} Autalizado Com Sucesso !!!")
    else
      render :action => "edit"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to(users_url, :notice => "Usuário Excluído")
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
