class ApplicationController < ActionController::Base
  before_action :ensure_json

  def ensure_json
    render json: { message: "Wrong content-type header" }, status: 406 and return unless request.content_type == "application/json"
  end

end
