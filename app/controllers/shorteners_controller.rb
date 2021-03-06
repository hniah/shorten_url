# frozen_string_literal: true

class ShortenersController < ApplicationController
  def home; end

  def show
    shorten_url = ShortenUrl.get_by_slug(slug)
    raise_not_found if shorten_url.nil?
    redirect_to shorten_url.original_url, status: :moved_permanently
  end

  private

  def slug
    params[:slug]
  end

  def raise_not_found
    raise ActionController::RoutingError, 'Not Found'
  end
end
