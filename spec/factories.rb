FactoryGirl.define do
  factory :api_key do
  end

  factory :room do
    sequence(:name) { |n| "Room #{n}" }
    sequence(:price) { |n| n * 10000 }
  end

  factory :user do
    username 'julsfelic'
    email 'julsfelic@example.com'
    password 'Allstar1989'
  end
end
