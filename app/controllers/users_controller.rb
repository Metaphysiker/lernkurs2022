class UsersController < ApplicationController

  def check_if_email_is_taken
    render json: !User.where(email: params[:email]).empty?
  end

  def sign_up

    unless user_signed_in?
      @user = User.new(email: params[:email])

      if @user.save
        @account.update(user_id: @user.id, first_name: params[:first_name])
        sign_in @user
        CourseMailer.welcome_mail(params[:email]).deliver_later
        render json: "success"
      else
        render json: @user.errors
      end

    end

  end

end
