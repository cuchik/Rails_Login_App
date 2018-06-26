class DisplaySoftwareInfoController < ApplicationController
  def display_info
  	@users = User.all
  	@title = 'test'
  end
end
