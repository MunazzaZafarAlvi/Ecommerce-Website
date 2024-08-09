class HomeController < ApplicationController
  before_action :authenticate_customer!

  def about_us
  end

  def faq
  end
end
