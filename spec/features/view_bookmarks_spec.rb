require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test') do

    Bookmark.create(url: 'https://www.google.com/')
    Bookmark.create(url: 'https://www.bbc.co.uk/news')
    Bookmark.create(url: 'https://www.makers.tech/')

    visit('/bookmarks')

    expect(page).to have_content 'https://www.google.com/'
    expect(page).to have_content 'https://www.bbc.co.uk/news'
    expect(page).to have_content 'https://www.makers.tech/'
  end
 end
end

