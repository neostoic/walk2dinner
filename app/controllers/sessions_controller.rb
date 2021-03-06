class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by_email(params[:session][:email])

        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:error] = "Invalid username or password"
            render 'new'
        end
    end

    def destroy
        log_out
        redirect_to root_url
    end
end