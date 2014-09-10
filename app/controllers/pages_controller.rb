class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
  end
  
  def redirect
  	redirect_to feed_entries_path
  end
end
