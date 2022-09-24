class UsersController < ApplicationController

  def check_if_email_is_taken
    render json: !User.where(email: params[:email]).empty?
  end

  def successfully_signed_in
    flash[:success] = I18n.t("devise.sessions.signed_in")
    redirect_to root_path
  end

end
