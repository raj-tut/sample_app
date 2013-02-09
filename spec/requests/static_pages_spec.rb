require 'spec_helper'

describe "Static Pages" do

	# let(:base_title) { "Ruby on Rails" }

 subject { page }

  describe "Home Page" do
    before { visit root_path }
    it  { should have_selector('h1',        :text => 'Sample App') }
    it  { should have_selector('title',     :text => full_title('')) }
    it  { should_not have_selector('title', :text => '| About') }
    end

    # it "should not have custom page title" do
    #   visit '/static_pages/home'
    #   page.should_not have_selector('title', :text => '| Home')
    # end
  
  describe "Help Page" do
    before { visit help_path }
  	it { should have_selector('h1',     :text => 'Help')}
  	it { should have_selector('title',  :text => full_title('Help')) }
  end

  describe "About Page" do
    before {visit about_path}
  	it  { should have_content('About Us') }
  	it  { should have_selector('title', :text => full_title('About Us')) }
  end	

  describe "Contact Page" do
    before {visit contact_path}
  	it  { should have_selector('h1', :text => 'Contact') }
  	it  { should have_selector('title', :text => full_title('Contact')) }
  end
end
