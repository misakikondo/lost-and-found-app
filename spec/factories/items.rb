FactoryBot.define do
  factory :item do
    items_name {Faker::Lorem.characters(number: 10)}
    persons_name {Faker::Name.name}
    memos {Faker::Lorem.question(word_count: 4)}
    places {Faker::Lorem.question(word_count: 4)}
    found_date {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    after(:build) do |i|
      i.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
