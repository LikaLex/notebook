def login(email, password)
  visit root_path
  click_link "Log in"
  fill_in :user_email, with: email
  fill_in :user_password, with: password
  click_button "Log in"
end