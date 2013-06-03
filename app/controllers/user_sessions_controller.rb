class UserSessionsController < ApplicationController

  def new
    @session = UserSession.new(session)
  end

  def create
    @session = UserSession.new(session, session_params)

    if(@session.authenticate)
      redirect_to root_path, :notice => t('flash.notice.signed_in')
    else
      render :new
    end

  end

  def destroy
    user_session.destroy
    redirect_to root_path, :notice => t('flash.notice.signed_out')
  end

  private
  def session_params
    params.require(:user_session).permit(:email, :password)
  end
end