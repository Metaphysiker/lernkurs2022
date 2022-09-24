# frozen_string_literal: true

class Devise::Passwordless::MagicLinksController < DeviseController
  prepend_before_action :require_no_authentication, only: :show
  prepend_before_action :allow_params_authentication!, only: :show
  prepend_before_action(only: [:show]) { request.env["devise.skip_timeout"] = true }

  def send_magic_link_to_user
    user = User.where(email: params[:user][:email]).first
    unless user.blank?
      user.send_magic_link(true)
    end

    flash[:success] = "e-Mail wurde versandt! Bitte schau in deiner Mailbox nach."

    redirect_to root_path
  end

  def show
    puts auth_options
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    redirect_to after_sign_in_path_for(resource)
  end

  protected

  def auth_options
    mapping = Devise.mappings[resource_name]
    { scope: resource_name, recall: "#{mapping.controllers[:sessions]}#new" }
  end

  def translation_scope
    "devise.sessions"
  end

  private

  def create_params
    resource_params.permit(:email, :remember_me)
  end
end
