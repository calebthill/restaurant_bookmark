class ApplicationController < ActionController::Base
  #include Yelp::V1::Review::Request
  #helper_method :search
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    favorite_restaurants_path
  end

  def check_following
    follower = User.find(user = params["id"])
    if current_user.friends.include?(follower)
      user_path(params["id"])
    else
      redirect_to users_path, notice: 'You must follow the user before viewing their restaurants!'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name]
  end
end
