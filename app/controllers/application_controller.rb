class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    case resource
      when Customer
        items_path
      when Admin
        admin_root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def guest_check
    if current_customer == Customer.find_by(email: 'guest@example.com')
      redirect_to items_path,notice: "このページを見るには会員登録が必要です。"
    end
  end

  def guest?
    if current_customer == Customer.find_by(email: 'guest@example.com')
      redirect_to item_path(params[:item_id]),notice: "この機能を使うには会員登録が必要です。"
    end
  end

  def is_matching_login_customer
    customer_id = params[:id].to_i
    unless customer_id == current_customer.id
      redirect_to items_path
    end
  end

end
