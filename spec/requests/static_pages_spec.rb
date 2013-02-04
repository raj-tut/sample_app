require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "should have the content 'Sample App' " do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      Page.should have_content('Sample App')
    end
  end

  describe "Help Page" do
  	it "should have content help" do
  		visit 'static_pages/help'
  		Page.should have_content('Help')
  	end
  end
end
