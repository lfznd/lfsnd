require 'spec_helper'

describe 'Login Form' do

  describe 'login on cross edit' do
    
      before(:each) do
        visit('/')
        @log = LoginCrossEdit.new
      end

      it 'search all about that bass' do
        @log.do_login("username", "password")
        page.save_screenshot ('screenshot1.png') 
        expect(page).to have_text("Find or create")
        fill_in("Type to search...", with: "all about that bass")
        expect(page).to have_text("All About That Bass")
        page.save_screenshot ('screenshot2.png')
     end
  

      it 'search Fuck' do
        @log.do_login("username", "password")
        page.save_screenshot ('screenshot3.png') 
        expect(page).to have_text("Find or create")
        fill_in("Type to search...", with: "Fuck")
        expect(page).to have_text("Your search found no matches")
        page.save_screenshot ('screenshot4.png')
     end
  end
end

 # the test is run twice !!! WTF?
 # how to transfer user data to a separate file
 # how to connect a table "Search_Test_Cases.xlsx"


=begin

   #chor
   #page.find_link [:href=> "songs/33911/edit"].click
   #expect(page).to have_text("Edit Song")
   expect(page).to have_link("Foo", :href=>"googl.com"
   expect(page).to have_link('A link', href: href=“/songs/33911/edit”).click
   expect(page).to have_text("Edit Song")
   page.save_screenshot ('screenshot4.png')
   <a href="/songs/33911/edit">All About That Bass</a>
   #expect(page).to have_xpath("//a",:href => "https://cross-edit-staging-frontend.herokuapp.com/songs/33911/edit").click
   #click_link 'All About That Bass'
   #<a href="/songs/33911/edit">All About That Bass</a>
   #find('a[href$="/songs/33911/edit"]').click_link
   #/cross-edit-staging-frontend.herokuapp.com/songs/33911/edit
   #<a href="/songs/33911/edit">All About That Bass</a>
   #expect(@session).to have_link(:'A link', href: :'/cross-edit-staging-frontend.herokuapp.com/songs/33911/edit').click_link
   #expect(page).to have_link("Foo", :href=>"songs/33911/edit")

=end

