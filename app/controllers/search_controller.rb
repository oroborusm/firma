class SearchController < ApplicationController
  def create
    keyword = "#{params[:keyword]}"
    palabra = "%#{keyword}%"

    #palabra = "%#{params[:keyword]}%"

    #@palabra = keyword
    @usuarios = Usuario.where("nombre LIKE ? OR rut LIKE ?",palabra,palabra)

    respond_to do |format|
      unless keyword.length <= 0
        format.html { redirect_to root_path }
        format.json { render json: @usuarios }
        format.js
      end
    end
  end
end
