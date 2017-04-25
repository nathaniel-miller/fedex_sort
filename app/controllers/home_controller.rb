class HomeController < ApplicationController
  before_action :check_signed_in, only: :index

  def check_signed_in
    redirect_to dashboard_path if signed_in?
  end

  def index
  end

  def dashboard
  end
end
