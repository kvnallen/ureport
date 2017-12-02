FactoryBot.define do
  factory :script do
    name { Faker::Name.name }
    command 'SELECT * FROM scripts'
  end
end