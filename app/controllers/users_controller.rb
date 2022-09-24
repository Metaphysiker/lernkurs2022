class UsersController < ApplicationController

  def check_if_email_is_taken
    render json: !User.where(email: params[:email]).empty?
  end

end
