class SongsController < ApplicationController
  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end

  post "/songs" do
    artist = Artist.find_or_create_by(name: params[:artist][:name])
    songs_hash = params[:song]
    songs_hash[:artist] = artist
    song = Song.create(songs_hash)

    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  get "/songs/new" do
    @genres = Genre.all
    @artists = Artist.all
    erb :"songs/new"
  end

  get "/songs/:slug/edit" do
    @genres = Genre.all
    @artists = Artist.all
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end

  patch "/songs/:slug" do
    song = Song.find_by_slug(params[:slug])
    song.update(params[:song])

    redirect "/songs/#{song.slug}"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end
end