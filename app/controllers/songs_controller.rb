class SongsController < ApplicationController
	before_action :set_instrument
	def index
		@songs = @instrument.songs
	end
	def show
		@song = @instrument.songs.find params[:id]
	end
	def found_songs
		@songs = @instrument.songs.where "title LIKE ?", "%#{params[:title]}%" # Mejorar para buscar canciones 
		#título parecido al introducido
	end
	def new
		@categories = Category.all
		@song = @instrument.songs.new
	end

	def create
		@song = @instrument.songs.new(title: params[:song_title]) 
		category = Category.find_by name: params[:song_category]
		
		tag1 = Tag.find_by(name: params[:song_tag1][:Cool]) unless params[:song_tag1][:Cool] == "no"
		tag2 = Tag.find_by(name: params[:song_tag2][:Long]) unless params[:song_tag2][:Long] == "no"
		tag3 = Tag.find_by(name: params[:song_tag3][:Weird]) unless params[:song_tag2][:Weird] == "no"

		@song.categories << category if category
		@song.tags << tag1 if tag1
		@song.tags << tag2 if tag2
		@song.tags << tag3 if tag3
		if @song.save
			flash[:alert] = "Song succesfully created!"
			redirect_to action: 'index', controller: 'songs'
		else
			flash[:alert] = "Sorry, try again"
			@categories = Category.all
			render 'new'
		end

	end
	protected

	def set_instrument
	  @instrument = Instrument.find params[:instrument_id]
	end
end
