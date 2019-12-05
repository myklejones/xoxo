class UsersController < ApplicationController

    def show
        user_id = params[:id]
        
        if user_id_from_token == user_id.to_i
            user = User.find(user_id)
            user = UserSerializer.new(user)
            all_users = User.all
            render json: {user: user, all_users: all_users}
        else 
            render json: {no_permit: true}, status: :unauthorized
        end
    end 

    def create
        
        user = User.create(new_user_params)
        if user.valid?
         
            render json: {ok:true}
        else
            
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end

    end

    def update
        
        
        user= User.find(update_user_params[:id])
        user.password = $pass
        user.update(update_user_params)
       
     
        if user_id_from_token == user.id
            render json: {ok:true, user: user} 
            
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end 

    def destroy
    end 
    
    private
    def update_user_params
        params.require(:user).permit(:id,:username, :name, :age, :dob, :city_state, :about_me, :sex)
    end

    def user_params 
        params.permit(:id,:username, :email, :name, :photo, :age, :dob, :city_state, :about_me, :sex, :active)
    end 

    def new_user_params 
        params.permit(:username, :password ,:email, :name, :photo, :age, :dob, :city_state, :about_me, :sex, :active)
    end 

end
