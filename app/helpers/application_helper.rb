# frozen_string_literal: true

module ApplicationHelper
  ALLOWED_FLASHES = %w[primary secondary success danger warning info light dark]

  def bs_flash(alert_type)
    if ALLOWED_FLASHES.include?(alert_type.to_s)
      alert_type
    else
      'primary'
    end
  end
end
