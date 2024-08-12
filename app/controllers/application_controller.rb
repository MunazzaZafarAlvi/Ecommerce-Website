class ApplicationController < ActionController::Base
  def set_ransack_query
    @q=Product.ransack(params[:q])
  end
end
