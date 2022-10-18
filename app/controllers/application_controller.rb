class ApplicationController < ActionController::Base

  def index
    redirect_to("/users")
  end
end
