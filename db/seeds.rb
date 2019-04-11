# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'clearing database'
User.destroy_all
Article.destroy_all
Comment.destroy_all


user_attributes = [
  {
    email: 'nicolas.bejenne@gmail.com',
    password: 'azerty',
    first_name: 'Nicolas',
    last_name: 'Béjenne',
    nick_name: 'NicolasB'
  },
  {
    email: 'nico.dev.rb@gmail.com',
    password: 'azerty',
    first_name: 'Jean-Michel',
    last_name: 'Climat',
    nick_name: 'JMCLI'
  }
]

User.create!(user_attributes)

article_attributes = [
  {
    title: "Le passage de Lorem Ipsum standard, utilisé depuis 1500",
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    user: User.first,
    source: 'Lorem ipsum dolor sit amet'
  },
  {
    title: "Section 1.10.32 du 'De Finibus Bonorum et Malorum' de Ciceron (45 av. J.-C.)",
    content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
    user: User.second,
    source: 'Lorem ipsum dolor sit amet'
  },
  {
    title: "Section 1.10.32 du 'De Finibus Bonorum et Malorum' de Ciceron (45 av. J.-C.)",
    content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
    user: User.first,
    source: 'Lorem ipsum dolor sit amet'
  },
  {
    title: "Le passage de Lorem Ipsum standard, utilisé depuis 1500",
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    user: User.second,
    source: 'Lorem ipsum dolor sit amet'
  }
]

Article.create!(article_attributes)

comments_attributes = [
  {
    article: Article.first,
    content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium d',
    author: User.first.id
  },
  {
    article: Article.second,
    content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium d',
    author: User.second.id
  },
  {
    article: Article.third,
    content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium d',
    author: User.first.id
  },
   {
    article: Article.first,
    content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium d',
    author: User.second.id
  },
  {
    article: Article.second,
    content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium d'
  },
  {
    article: Article.third,
    content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium d'
  }
]

Comment.create!(comments_attributes)

puts 'created seed'
