# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  devise_group :user, contains: %i[student teacher]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [
        :first_name,
        :last_name,
        :adress,
        { city_attributes: %i[name zip_code] }
      ]
    )
  end
end
