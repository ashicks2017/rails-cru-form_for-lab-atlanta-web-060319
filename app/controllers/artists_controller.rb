class ArtistsController < ApplicationController
	def index
		@artists = Artist.all
	end

	def show
		@artist = Artist.find(params[:id])
	end

	def new
		@artist = Artist.new
	end
    
    def create
        @artist = Artist.new(artist_params)
        if @artist.save
          redirect_to artist_path(@artist)
        else
          render :new
        end
      end
	# def create
	#   @artist = Artist.new(artist_params)
	#   @artist.save
	#   redirect_to artist_path(@artist)
	# end

	def edit
		@artist = Artist.find(params[:id])
    end

	def update
	  @artist = Artist.find(params[:id])
	  @artist.update(artist_params)
	  redirect_to artist_path(@artist)
	end
   
  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to artists_path
  end
    
	private

		def artist_params
			params.require(:artist).permit(:name, :bio)
		end
end
