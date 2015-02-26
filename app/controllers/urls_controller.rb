class UrlsController < ApplicationController
  def index
  end

  def new
  	@url = Url.new
  end

  def create
  	@url = Url.new(user_params)
  	@url.shortened = (0..8).map { 65.+(rand(25)).chr }.join.downcase
  	if @url.save
  		flash[:success] = "Your short url was successfully created"
  		render "show"
  	else
  		flash[:error] = "There was a problem creating your short url"
  		redirect_to root_url
  	end
 	end

  def show
  	@url = Url.find_by(user_params)	
  end

  def match
  	@url = Url.find_by(shortened: params[:shortened])
  	if @url
  		redirect_to @url.original
  	else
  		flash[:danger] = "Could not locate your url"
  		redirect_to root_url
  	end
  end

  private

  	def user_params
  		params.require(:url).permit(:original)
  	end
end
