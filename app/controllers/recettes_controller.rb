class RecettesController < ApplicationController
    
    def new
        @recette = Recette.new
    end
        
    def create
        @recette = Recette.new(recette_params)
        @recette.save
        redirect_to recette_show(@recette)
    end
    
    private
    
    def recette_params
       params.require(:recette).permit(:title, :description, :etapes) 
    end
end 