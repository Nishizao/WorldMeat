class RecettesController < ApplicationController
    
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
    
    private
    
    def recette_params
       params.require(:recette).permit(:title, :description, :etapes) 
    end
end 