class UsersController < ApplicationController
  after_action :verify_authorized

  def check_if_email_is_taken
    authorize User
    render json: !User.where(email: params[:email]).empty?
  end

  def successfully_signed_in
    authorize User
    flash[:success] = I18n.t("devise.sessions.signed_in")
    redirect_to root_path
  end

end
