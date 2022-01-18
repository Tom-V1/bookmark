feature "Add new bookmark" do
  scenario 'User can save a bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://test.com')
    click_button('Submit')

    expect(page).to have_content 'http://test.com'
  end
end