class RecettesController < ApplicationController
    before_action :set_recette, only: [:edit, :update, :show, :destroy]
    
    def index
       @recette = Recette.all 
    end
    
    def new
        @recette = Recette.new
    end
    
    def edit
        @recette = Recette.find(params[:id])
    end
        
        
    def create
        @recette = Recette.new(recette_params)
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
    
    def set_recette
        @recette = Recette.find(params[:id])
    end
    def recette_params
       params.require(:recette).permit(:title, :description, :etapes) 
    end
end 