class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def not_authenticated
    redirect_to login_path, notice: "You need to be logged in to do this"
  end
  helper_method :mailbox

private
  def mailbox
    @mailbox ||= current_user.mailbox
  end

end
