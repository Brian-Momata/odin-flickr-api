require 'flickr'

class StaticPagesController < ApplicationController
  def home
    @photos = nil
    unless params[:flickr_id].nil?
      flickr = Flickr.new
      user_id = params[:flickr_id]
      begin
        @photos = flickr.people.getPublicPhotos(user_id: user_id)
      rescue StandardError => e
        flash[:alert] = "Can't match the user ID"
        redirect_to root_path
      end
    end
  end
end
