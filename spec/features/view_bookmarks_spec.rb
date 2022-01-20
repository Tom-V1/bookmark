require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test') do

    Bookmark.create(url: 'https://www.google.com/', title: 'Google')
    Bookmark.create(url: 'https://www.bbc.co.uk/news', title: 'BBC News')
    Bookmark.create(url: 'https://www.makers.tech/', title: 'Makers Academy')

    visit('/bookmarks')

    expect(page).to  have_link('Google', href: 'https://www.google.com/')
    expect(page).to  have_link('BBC News', href: 'https://www.bbc.co.uk/news')
    expect(page).to  have_link('Makers Academy', href: 'https://www.makers.tech/')
   
  end
 end
end

