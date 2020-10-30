class SigninController < ApplicationController
    # similar to authenticate user
    before_action :authorize_access_request!, only: [:destroy]

    # login
    def create
        # This time the user finds instead of create
        user = User.find_by(email: params[:email])

        if user.authenticate(params[:password])
            payload = { user_id: user.id }
            # refresh if things aren't 'good' 
            session = JWTSession::Session.new(payload: payload, refresh_by_access_allowed: true)
            tokens = session.login
            response.set_cookies(JWTSessions.access_cookie, 
                                value: tokens[:access], 
                                httponly: true,
                                secure: Rails.env.production?)
            render json: { csrf: tokens[:csrf] }
        else    
            # This method comes from our Application controller
            not_authorized
        end
    end

    # logout
    def destroy
        session = JWTSessions::Session.new(payload: payload)
        session.flush_by_access_payload
        render json: :ok
    end

    private

        def not_found
            render json: { error : "Cannot find email/password combination" }, status: :not_found
        end
end
