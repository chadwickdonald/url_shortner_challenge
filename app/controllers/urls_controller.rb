class UrlsController < ApplicationController
  def index
  end

  def new
  	@url = Url.new
  end

  def create
  	@url = Url.new(user_params)
  	if @url.save
  		flash[:success] = "Your short url was successfully created"
  		render "show"
  	else
  		flash[:danger] = "There was a problem creating your short url"
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
