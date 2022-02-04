# frozen_string_literal: true

class PagesController < ApplicationController
  def show
    case params[:id]
    when 'about'
      render 'pages/about'
    when 'roadmap'
      render 'pages/roadmap'
    else
      raise ActionController::RoutingError, 'Not Found'
    end
  end
end
