class FavoritesController < ApplicationController

    def create
    	code = Code.find(params[:code_id])
    	favorite = current_user.favorites.new(code_id: code.id)
    	favorite.save
    	redirect_to code_path(code)
    end

    def destroy
    	code = Code.find(params[:code_id])
    	favorite = current_user.favorites.find_by(code_id: code.id)
    	favorite.destroy
    	redirect_to code_path(code)
    end

end
