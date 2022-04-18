class Api::V1::SessionsController < ApplicationController
    def create
        user = User.find_by(email: (params[:email]))
        if user
            session[:user_id] = user.id # tinker
            render json: {
                status: :session_created,
                logged_in: true,
                user: user
            }
        else
            redirect_to("http://localhost:5000/user_choice", flash: "Please Sign Up first!")
        end
    end

    def logged_in
        if current_user
            render json: {
                logged_in: true,
                user: current_user
            }
        else
            render json: {
                logged_in: false
            }
        end
    end

    def logout
        reset_session
        render json: {status: 200, logged_out: true}
    end

end
