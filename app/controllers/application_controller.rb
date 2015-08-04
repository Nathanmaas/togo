class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :current_user

  def check_auth
    unless current_user
      redirect_to root_path
    end
  end

  def check_no_auth
    redirect_to root_path if current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def load_model
    return unless params[:id]
    model_name = params[:controller].singularize
    my_model = model_name.classify.safe_constantize
    model_inst = my_model.find params[:id]
    instance_variable_set("@#{model_name}",model_inst)
  end

  def check_ownership
    model_name = params[:controller].singularize
    model_inst = instance_variable_get("@#{model_name}")
    owner = model_inst.user
    if owner.nil? || owner.id != current_user.id
      redirect_to root_path
    end
  end
end
