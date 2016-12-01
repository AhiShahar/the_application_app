class PagesController < ApplicationController
  def home
    @images = []
    User.all.each do |u|
      if u.image && u.image != "https://robohash.org/my-own-slug.png?size=50x50&set=set1" && u.image != "" && u.image != "https://robohash.org/my-own-slug.png?size=70x70&set=set1"
        @images << u.image
      end
    end

  end
end
