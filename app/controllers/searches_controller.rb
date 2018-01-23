class SearchesController < ApplicationController
	def new
		@results = []
		@search = Search.new
	end

	def search
		keyword = params[:search][:keyword]
		@results = Search.search_for(keyword)
		@search = Search.new(search_params)
		render :new
	end

	def search_params
		params.require(:search).permit(:keyword)
	end

end
