class ApplicationController < ActionController::API
    include JWTSessions::RailsAuthorization
    rescue_from JWTSessions::Errors::Unauthorized, with :not_authorized

    private

        # Since we are not using device
        def current_user
            @current_user ||= User.find(payload['user_id'])

        # json and not a view since using API    
        # sets status headers to unauthorized
        def not_authorized
            render json: {error: 'Not authorized'}, status: :unauthorized

    end
end

