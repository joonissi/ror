class ApplicationController < ActionController::Base
  #before_action :ensure_that_is_not_banned
  # määritellään, että metodi current_user tulee käyttöön myös näkymissä
  helper_method :current_user

  def ensure_that_is_not_banned
    redirect_to signin_path, notice: 'you are banned, please contact admin' if !current_user.nil? && current_user.banned?
  end

  def ensure_that_is_admin
    redirect_to user_path, notice: 'you need to be admin to do that' if !current_user.admin?
  end

  def ensure_that_signed_in
    redirect_to signin_path, notice: 'you should be signed in' if current_user.nil?
  end

  def current_user
    return nil if session[:user_id].nil?
    User.find_by(id: session[:user_id])
  end
end
