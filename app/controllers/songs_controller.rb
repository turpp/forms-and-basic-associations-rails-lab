class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
    @genres=Genre.all.map do |g|
      [g.name,g.id]
    end
    
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      #   helpers.artist_name=(params[:song][:artist])
          notes=params[:song][:notes]
          notes.each do |note|
            n=Note.create(content: params[:song][:notes][note])
            @song.notes.push(n)
           end
      @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title,:genre_id, :artist_name,:notes)
  end
end

