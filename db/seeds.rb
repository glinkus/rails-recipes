require 'faker'

ITEM_COUNT = ENV.fetch("ITEM_COUNT", 500).to_i

puts "Seeding #{ITEM_COUNT} items..."

ITEM_COUNT.times do |i|
  Item.create!(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(sentence_count: 3)
  )

  puts "Created #{i + 1}/#{ITEM_COUNT}" if (i + 1) % 100 == 0
end

puts "Done! Seeded #{ITEM_COUNT} items."