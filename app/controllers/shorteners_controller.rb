class ShortenersController < ApplicationController
  def show
    shorten_url = ShortenUrl.find_by_slug(params[:slug]) 
    raise ActionController::RoutingError.new('Not Found') if shorten_url.nil?
    redirect_to shorten_url.original_url
  end
end