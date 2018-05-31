FactoryBot.define do
  factory :post do
    name 'Breaking news worldwide.'
    content { FFaker::Lorem.sentence }
    file 'some_file_path.txt'
    category
  end
end
