# frozen_string_literal: true

class ShortenersController < ApplicationController
  def show
    shorten_url = ShortenUrl.find_by(slug: params[:slug])
    raise ActionController::RoutingError, 'Not Found' if shorten_url.nil?

    redirect_to shorten_url.original_url
  end
end
