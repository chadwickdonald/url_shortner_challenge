class Url < ActiveRecord::Base
	before_save :create_short_url

	def self.base
		url_base = ENV["RAILS_ENV"] == "production" ? "blooming-everglades-5933.herokuapp.com/" : "localhost:3000/"
	end

	private

		def create_short_url
			self.shortened = (0..8).map { 65.+(rand(25)).chr }.join.downcase
		end
end
