# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

l1 = Link.create(url: 'https://paper.dropbox.com/doc/Build-a-URL-shortener-BdG2JwuLz5jG4ke1kf4Ye')
l2 = Link.create(url: 'https://www.blindtextgenerator.com/about-lorem-ipsum')

8.times { l1.impressions.create({ ip_address: '127.0.0.1', country: "US" }) }
5.times { l1.impressions.create({ ip_address: '127.0.0.1', country: "IN" }) }
3.times { l2.impressions.create({ ip_address: '127.0.0.1', country: "IN" }) }
