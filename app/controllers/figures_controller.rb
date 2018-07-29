class FiguresController < ApplicationController

	get "/figures" do
		@figures = Figure.all

		erb :"figures/index"
	end


	get "/figures/new" do
		@titles = Title.all
		@landmarks = Landmark.all 
		
		erb :"figures/new"
	end

	get "/figures/:id" do 
		@figure = Figure.find(params[:id])

		erb :"/figures/show"
	end

	post "/figures" do

		@figure = Figure.create(params[:figure])
		@figure.landmarks << Landmark.find_or_create_by(params[:landmark]) if !params[:landmark][:name].empty?
		@figure.titles << Title.find_or_create_by(params[:title]) if !params[:title][:name].empty?
		@figure.save

		redirect :"/figures/#{@figure.id}"
	end

	get "/figures/:id/edit" do
		@figure = Figure.find(params[:id])
		@titles = Title.all 
		@landmarks = Landmark.all

		erb :"/figures/edit"
	end

	patch "figures/:id" do
		@figure = Figure.find(params[:id])
		@figure.update(params[:figure])
		@figure.titles << Title.find_or_create_by(params[:title]) if !params[:title][:name].empty?
    	@figure.landmarks << Landmark.find_or_create_by(params[:landmark]) if !params[:landmark][:name].empty?
		@figure.save

		redirect to "/figures/#{@figure.id}"
	end 
end