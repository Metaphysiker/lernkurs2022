class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :set_account

  def set_account
    if user_signed_in?
      if current_user.account.present?
        @account = current_user.account
      else
        @account = Account.create(user_id: current_user.id)
      end
    elsif cookies["philosophie-lernkurs-account-id"].present? && !Account.where(id: cookies["philosophie-lernkurs-account-id"]).empty?
      @account = Account.find(cookies["philosophie-lernkurs-account-id"])
      if @account.user.present?
        #redirect_to new_user_session_path
      end
    else
      @account = Account.create
      cookies.permanent["philosophie-lernkurs-account-id"] = @account.id
    end
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Bitte anmelden oder registrieren."
    redirect_back(fallback_location: root_path)
  end


end
