require 'sequel'
require 'pg'
require 'dotenv/load'

# for local testing/developing of the UI; this script will generate data for
# your local postgres, using the config as defined in your .env file

DB =
  Sequel.connect(
    "postgres://#{ENV['USERNAME']}:#{ENV['PASSWORD']}@#{ENV['HOST']}:#{ENV['PORT']}/#{ENV['DB']}"
  )

DB.drop_table?(:compilations_books)

DB.create_table :compilations_books do
  primary_key :id
  Date :added
  String :title
  String :credits
  String :publisher
  Integer :page_count
  String :synopsis
  String :impressions
  String :image_url
end

books = DB[:compilations_books]

books.insert(
  title: 'Atomic Habits',
  added: '2021-04-03',
  credits: 'James Clear',
  publisher: 'Cornerstone Digital',
  page_count: 277,
  synopsis:
    'People think when you want to change your life, you need to think big. 
    But world-renowned habits expert James Clear has discovered another way. He knows 
    that real change comes from the compound effect of hundreds of small decisions – 
    doing two push-ups a day, waking up five minutes early, or holding a single short phone call.',
  impressions:
    'Clear and concise. Highlights the ways you can encourage the behaviours you are
     looking to adopt through the composition of small actions. An influential read.',
  image_url: 'https://via.placeholder.com/220x320'
)

books.insert(
  title: 'The DevOps Handbook',
  added: '2021-04-12',
  credits: 'Gene Kim, Jez Humble, Patrick Debois, John Willis',
  publisher: 'IT Revolution Press',
  page_count: 437,
  synopsis:
    'Following in the footsteps of The Phoenix Project, The DevOps Handbook shows leaders how to 
    replicate these incredible outcomes, by showing how to integrate Product Management, Development, 
    QA, IT Operations, and Information Security to elevate your company and win in the marketplace.',
  impressions:
    'Crammed full of information that is perhaps a little superficial in places; this is understandable 
    given the broad scope of the book, though. Ultimately, this is a solid primer for familiarising 
    yourself with the systemic view DevOps occupies.',
  image_url: 'https://via.placeholder.com/220x320'
)

books.insert(
  title: 'Expressive Design Systems',
  added: '2021-05-01',
  credits: 'Yesenia Perez-Cruz',
  publisher: 'A Book Apart',
  page_count: 126,
  synopsis:
    'Good design systems can help you create digital products with efficiency and consistency. 
      But great design systems will support and strengthen your team’s creativity at the same time. 
      In Expressive Design Systems, Yesenia Perez-Cruz shows you how to build useful, dependable 
      systems that not only maintain harmony across your products, but also flex to accommodate 
      inspiration and experimentation.',
  impressions:
    'Like other titles published by A Book Apart, this is a pithy, accessible read that distils a 
      lot of useful information about design systems: the creation and maintenance of them, as well 
       as the importance of governance.',
  image_url: 'https://via.placeholder.com/220x320'
)
