require 'spec_helper'

describe "Static Pages" do
  describe "Home Page" do
    it "should have the h1 'Sample App'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      Page.should have_selector('h1', :text => 'Sample App')
    end

    it "should have the title 'Home'" do
    	visit '/static_pages/home'
    	Page.should have_selector('title', :text => 'Home')
    end
  end

  describe "Help Page" do
  	it "should have content help" do
  		visit '/static_pages/help'
  		Page.should have_content('Help')
  	end

  	it "should have the title Help" do
  		visit  '/static_pages/help'
  		Page.should have_selector('title', :text => 'Help')
  	end
  end

  describe "About Page" do
  	it "should have the content 'About US'" do
  		visit '/static_pages/about'
  		Page.should have_content('About Us')
  	end

  	it "should have the title About us" do
  		visit '/static_pages/about'
  		Page.should have_selector('title', :text => 'About Us')
  		
  	end
  end	

end
