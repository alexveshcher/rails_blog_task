FactoryBot.define do
  factory :comment do
    author 'King Turin.'
    content { FFaker::Lorem.sentence }
    post
  end
end
