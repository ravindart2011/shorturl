require "rails_helper"

RSpec.describe Link, type: :model do

  it "has a URL" do
    link = Link.create(url: "https://www.google.com/") # creating a new link 'instance'
    expect(link.url).to eq("https://www.google.com/") # this is our expectation
    expect(link.slug).not_to be_nil
  end
  
  it "should fail without URL" do
    link = Link.new(url: nil)
    
    expect(link).to_not be_valid
    expect(link.errors.messages[:url]).to eq(["can't be blank", "is invalid"])
    expect(link.save).to be_falsey
  end
  
  describe '#short' do
    it 'should return short url' do
      link = Link.new(url: "https://www.google.com/")

      expect(link).to receive(:short).and_return("http://sa.com/s/abc12")
      expect(link.short).to eq("http://sa.com/s/abc12")
    end
  end 
   
end
