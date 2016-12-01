class PagesController < ApplicationController
  def home
    users = User.all.where( :image )
  end
end
