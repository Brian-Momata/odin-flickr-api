require 'flickr'

class StaticPagesController < ApplicationController
  def home
    display_photos unless params[:flickr_id].nil?
  end

  private

  def display_photos
    flickr = Flickr.new
    user_id = params[:flickr_id]
    begin
      @photos = flickr.people.getPublicPhotos(user_id: user_id)

      puts @photos.inspect
      
    rescue StandardError => e
      flash[:alert] = "Can't match the user ID"
      redirect_to root_path
    end
  end
end
