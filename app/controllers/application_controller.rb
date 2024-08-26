class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    private

    def ensure_json_request
        return if request.format.json?

        render json: { error: 'Only JSON format is supported' }, status: :not_acceptable
    end
end
