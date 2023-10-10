class ApplicationController < ActionController::Base
  def go_to_root
    flash[:notice] = 'Page not found. Redirecting to the homepage.'
    redirect_to root_path
  end
end
