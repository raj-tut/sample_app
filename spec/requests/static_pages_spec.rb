require 'spec_helper'

describe "Static Pages" do

	let(:base_title) { "Ruby on Rails" }
  describe "Home Page" do
    it "should have the h1 'Sample App'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "should have the title 'Home'" do
    	visit '/static_pages/home'
    	page.should have_selector('title', :text => "#{base_title} | Home")
    end

    it "should not have custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
  end

  describe "Help Page" do
  	it "should have content help" do
  		visit '/static_pages/help'
  		page.should have_content('Help')
  	end

  	it "should have the title Help" do
  		visit  '/static_pages/help'
  		page.should have_selector('title', :text => 'Help')
  	end
  end

  describe "About Page" do
  	it "should have the content 'About Us'" do
  		visit '/static_pages/about'
  		page.should have_content('About Us')
  	end

  	it "should have the title About us" do
  		visit '/static_pages/about'
  		page.should have_selector('title', :text => 'About Us')
  		
  	end
  end	

  describe "Contact" do
  	it "should have h1 Contact" do
  		visit '/static_pages/contact'
  		page.should have_selector('h1', :text => 'Contact')
  	end

  	it "should have title Contact" do
  		visit '/static_pages/contact'
  		page.should have_selector('title', :text => 'Contact')
  	end
  end
end
