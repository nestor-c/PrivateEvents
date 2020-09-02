class UsersController < ApplicationController

    def new 
        @user = User.new
    end

    def show
        if current_user
            @user = current_user
            @past_events = current_user.past_events
            @upcoming_events = current_user.upcoming_events
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:current_user_id] = @user.id
            redirect_to root_url, notice: "Thank you for signing up!"
        else
            render "new"
        end
    end

    def destroy
    end

    private 
        def user_params
            params.require(:user).permit(:name, :email)
        end

        
end