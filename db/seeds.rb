# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
	email: 'mage@nta',
	password: 'magemage'
	)

User.create!([
	{
	email: '0@0',
	name: 'miyu',
    gender: 'Woman',
    height: '159',
    password: '000000',
    },
	{
	email: '2@2',
	name: 'shoes',
    gender: 'Man',
    height: '175',
    password: '222222',
    },
	{
	email: '3@3',
	name: 'lysa',
    gender: 'Woman',
    height: '160',
    password: '333333',
    },
	{
	email: '4@4',
	name: 'Q',
    gender: 'Unselect',
    height: '165',
    password: '444444',
    },
	{
	email: '5@5',
	name: 'Mary',
    gender: 'Woman',
    height: '168',
    password: '555555',
    }
])





