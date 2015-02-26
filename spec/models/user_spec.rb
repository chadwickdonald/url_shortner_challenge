require 'rails_helper'

RSpec.describe Url, type: :model do
  it "should create a url" do
  	original_url = "http://guides.rubyonrails.org/active_record_validations.html"
  	url = Url.create(original: original_url)
  	expect(url.original).to eq(original_url)
  	expect(url.shortened.length).to eq(9)
  end
end
