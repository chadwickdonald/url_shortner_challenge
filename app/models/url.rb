class Url < ActiveRecord::Base
	before_save :create_short_url

	private

		def create_short_url
			self.shortened = (0..8).map { 65.+(rand(25)).chr }.join.downcase
		end
end
