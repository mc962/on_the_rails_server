# frozen_string_literal: true

class PagesController < ApplicationController
  def show
    case params[:id]
    when 'about'
      render 'pages/about'
    when 'roadmap'
      render 'pages/roadmap'
    when 'attributions'
      render 'pages/attributions'
    else
      raise ActionController::RoutingError, 'Not Found'
    end
  end
end
