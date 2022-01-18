require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      
      Bookmark.create(url: 'https://www.google.com/')
      Bookmark.create(url: 'https://www.bbc.co.uk/news')
      Bookmark.create(url: 'https://www.makers.tech/')


      bookmarks = Bookmark.all

      expect(bookmarks).to include('https://www.google.com/')
      expect(bookmarks).to include('https://www.bbc.co.uk/news')
      expect(bookmarks).to include('https://www.makers.tech/')
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://test.com')

      expect(Bookmark.all).to include 'http://test.com'
    end
  end
end