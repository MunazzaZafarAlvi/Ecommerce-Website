class HomeController < ApplicationController
  before_action :authenticate_customer! # Use this for customers
  # Or: before_action :authenticate_admin! # Use this for admins
  def index
  end
end
