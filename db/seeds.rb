# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
    {username: 'bob234'},
    {username: '123go'},
    {username: 'thisisit'},
    {username: 'hello'}
])

Poll.create([
    {title: 'Hello', user_id:1},
    {title: 'Second poll', user_id:1},
    {title: 'This is my poll', user_id:2},
    {title: 'What?', user_id:3},
])

Question.create([
    {poll_id: 1, body: 'What?'},
    {poll_id: 1, body: 'Hmm?'},
    {poll_id: 2, body: 'This is a question?'},
    {poll_id: 3, body: 'Question?'}
])

AnswerChoice.create([
    {question_id: 1, answer: 'answer 1'},
    {question_id: 1, answer: 'answer 2'},
    {question_id: 1, answer: 'answer 3'},
    {question_id: 2, answer: 'red'},
    {question_id: 2, answer: 'orange'},
    {question_id: 2, answer: 'yellow'},
    {question_id: 3, answer: 'glasses'},
    {question_id: 3, answer: 'contacts'},
    {question_id: 4, answer: 'pc'},
    {question_id: 4, answer: 'mac'},
])

Response.create([
    {user_id: 2, answer_choice_id: 1},
    {user_id: 3, answer_choice_id: 2},
    {user_id: 2, answer_choice_id: 4},
    {user_id: 1, answer_choice_id: 7},
    {user_id: 1, answer_choice_id: 10},
])