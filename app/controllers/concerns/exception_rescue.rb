# frozen_string_literal: true

module ExceptionRescue
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :render_404

    def render_404
      respond_to do |format|
        format.json { render json: {message: "Not Found"}, status: :not_found }
        format.html { render file: Rails.root.join('public/404.html').to_s, layout: false, status: :not_found }
      end
    end
  end
end
