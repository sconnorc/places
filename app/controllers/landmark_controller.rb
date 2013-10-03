class LandmarkController < ApplicationController
  def index
  end

  def within
  	@marks = Landmark.within(5, :origin => [params[:lat], params[:lon]])
  	render json: @marks
  end
end
