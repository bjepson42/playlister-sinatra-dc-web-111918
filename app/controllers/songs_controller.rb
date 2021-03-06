class SongsController < ApplicationController

	get '/songs' do
		@songs = Song.all
		erb :'/songs/index'
	end

	get '/songs/new' do
		@songs = Song.new
		erb :'/songs/new'
	end

	post'/songs' do
		@song = Song.create(params)
		flash[:message] = "Successfully created song."
		redirect "/songs/#{@song.slug}"
	end

	get '/songs/:slug' do
		slug = params[:slug]
		@song = Song.find_by_slug(slug)
		erb :'/songs/show'
	end

	

end
