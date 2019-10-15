FactoryBot.define do
  factory :user do
  email { 'alexandrianov@gmail.com' }
    admin true
  end

  factory :random_user, class: User do
    email { Faker::Internet.email }
    admin false
  end
end
