class LoginController < ApplicationController
    def create 
       
        user = User.find_by(username: params[:username])
  

        if user && user.authenticate(params[:password])
          
           $pass = params[:password]
            render json: {token: create_token(user.id), user_id: user.id}
            
        else
            render json: {errors: ["password or username does not match"]}, status: :unprocessable_entity
        end
    end
end
