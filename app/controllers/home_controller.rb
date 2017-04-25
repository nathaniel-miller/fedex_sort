class HomeController < ApplicationController
  before_action :check_signed_in, only: :index

  def check_signed_in
    if signed_in?
      redirect_to dashboard_path
    else
      redirect_to new_user_session_path
    end
  end

  def index
  end

  def dashboard
  end
end
