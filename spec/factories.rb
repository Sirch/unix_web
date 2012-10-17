FactoryGirl.define do
  factory :user do
    name                  "Chris Clayton"
    email                 "chris.does.this@gmail.com"
    password              "letmein"
    password_confirmation "letmein"
  end
end