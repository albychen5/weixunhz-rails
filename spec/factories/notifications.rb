FactoryGirl.define do
  factory :notification do
    user nil
    subscribed_user nil
    event "MyString"
    references "MyString"
    identifier 1
    type ""
    read false
  end
end
