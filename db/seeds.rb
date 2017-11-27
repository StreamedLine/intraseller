User.create(email: 'dave@dave.com', password: 123456789)

category = Category.create(name: 'photo')

item1 = Item.create(bhsku: 'SODSCHX90VB', mfrsku: 'DSCHX90V/B', category_id: category.id, image: 'https://static.bhphoto.com/images/images250x250/1481216759000_1137175.jpg')
item2 = Item.create(bhsku: 'NICPW300B', mfrsku: '26523', category_id: category.id, image: 'https://static.bhphoto.com/images/images250x250/1496213450000_1341600.jpg')

question = category.questions.create(question: 'Which point and shoot cameras have built in GPS?')

question.answers.create(answer: 'See items associated with this answer')
category.questions.last.answers.last.items << [item1, item2]

category.save

