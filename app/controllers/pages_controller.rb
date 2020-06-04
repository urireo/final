class PagesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  layout 'pages_layout' #this will check for flash alerts
  def home
  end

  def about
  end
end

def catch_not_found(e)
  Rails.logger.debug("We had a not found exception.")
  flash.alert = e.to_s
  redirect_to posts_path
end
