FactoryGirl.define do

  factory :user do

    login "LikaLex"
    password "secret123"
    password_confirmation { password }


    after(:create) do |user|
      user.subscription.update_attributes(active: true, expire_date: Date.today + 4.weeks)
    end
  end

end