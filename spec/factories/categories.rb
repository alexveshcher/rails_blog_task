FactoryBot.define do
  factory :category do
    name 'Breaking news worldwide.'
    description { FFaker::Lorem.phrase }
  end
end
