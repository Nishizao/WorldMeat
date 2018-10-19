class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def index
       @user = User.paginate(:page => params[:page], :per_page => 5)
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "le profil #{@user.username} est créé"
            redirect_to root_path
        else
           render 'new' 
        end
    end
    
    def edit
    end
    
    def update
       if @user.update(user_params)
           flash[:success] = "Profil mis à jour"
           redirect_to root_path(@user)
       else
           render 'edit'
       end
    end
    
    def show
        @user_recettes = @user.recettes.paginate(:page => params[:page], :per_page => 5)
    end
    
    private
    
    def require_same_user
       if current_user != @user
          flash[:danger] = "Vous n'êtes pas le bon utilisateur, action impossible."
          redirect_to root_path
      end
    end
    
    def set_user
        @user = User.find(params[:id])
    end
    
    def user_params
       params.require(:user).permit(:username, :email, :password) 
    end
end