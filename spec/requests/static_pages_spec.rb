require 'spec_helper'

describe "Static Pages" do

	# let(:base_title) { "Ruby on Rails" }

 subject { page }

 shared_examples_for "all static_pages" do
  it { should have_selector('h1', text: heading) }
  it { should have_selector('title', text: full_title(page_title)) }
 end


  describe "Home Page" do
    before { visit root_path }
    let(:heading)     { 'One Family' }
    let(:page_title)  { '' }
    it_should_behave_like "all static_pages"

    # it  { should have_selector('h1',        :text => 'Sample App') }
    # it  { should have_selector('title',     :text => full_title('')) }
    it  { should_not have_selector('title', :text => '| About') }
    end

    # it "should not have custom page title" do
    #   visit '/static_pages/home'
    #   page.should_not have_selector('title', :text => '| Home')
    # end
  
  describe "Help Page" do
    before { visit help_path }
    let(:heading)     { 'Help' }
    let(:page_title)  { 'Help' }
    it_should_behave_like "all static_pages"
  	# it { should have_selector('h1',     :text => 'Help')}
  	# it { should have_selector('title',  :text => full_title('Help')) }
  end

  describe "About Page" do
    before {visit about_path}
    let(:heading)      { 'About Us' }
    let(:page_title)   { 'About Us' }
    it_should_behave_like "all static_pages"
  	# it  { should have_content('About Us') }
  	# it  { should have_selector('title', :text => full_title('About Us')) }
  end	

  describe "Contact Page" do
    before {visit contact_path}
     let(:heading)      { 'Contact' }
     let(:page_title)   { 'Contact' }
     it_should_behave_like "all static_pages"
  	# it  { should have_selector('h1', :text => 'Contact') }
  	# it  { should have_selector('title', :text => full_title('Contact')) }
  end

  it "should have the right link on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "One Family"
    page.should have_selector 'title', text: full_title('Home') 
  end
end
