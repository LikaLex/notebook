describe 'Taking a course' do

  let!(:user) { create(:user, email: "bob@mail.ru", password: "qweqweqwe", password_confirmation: "qweqweqwe") }

  before(:each) do
    login("bob@mail.ru", "qweqweqwe")
  end

  it "opens courses page after login" do
    expect(page).to have_content "New note"
  end

end