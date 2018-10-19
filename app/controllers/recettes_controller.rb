class RecettesController < ApplicationController
    before_action :set_recette, only: [:edit, :update, :show, :destroy]
    before_action :require_user, exept: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def index
       @recette = Recette.paginate(:page => params[:page], :per_page => 5)
    end
    
    def new
        @recette = Recette.new
    end
    
    def edit
        @recette = Recette.find(params[:id])
    end
        
        
    def create
        @recette = Recette.new(recette_params)
        @recette.user = current_user
        if @recette.save
            flash[:success] = "Recette ajoutée"
            redirect_to recette_path(@recette)
        else
            render 'new'
        end
    end
    
    def update
       @recette = Recette.find(params[:id])
       if @recette.update(recette_params)
           flash[:success] = "Recette modifée"
           redirect_to recette_path(@recette)
       else
           render 'edit'
       end
    end
    
    def show
         @recette = Recette.find(params[:id])
    end
    
    def destroy
        @recette = Recette.find(params[:id])
        @recette.destroy
        flash[:danger] = "Recette supprimée"
        redirect_to recettes_path
    end
    
    private
    
    def require_same_user
       if current_user != @recette.user_id
          flash[:danger] = "Vous n'êtes pas le créateur de la recette, action impossible."
          redirect_to root_path
       end
    end
    
    def set_recette
        @recette = Recette.find(params[:id])
    end
    def recette_params
       params.require(:recette).permit(:title, :description, :etapes) 
    end
end 