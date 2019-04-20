class Question < ApplicationRecord
    validates :poll_id, :body, presence: true

    belongs_to(
        :poll,
        class_name: 'Poll',
        foreign_key: :poll_id,
        primary_key: :id
    )

    has_many(
        :answer_choices,
        class_name: 'AnswerChoice',
        foreign_key: :question_id,
        primary_key: :id
    )

    has_many :responses, through: :answer_choices, source: :responses

    def results
        resultshash = {}
        
        answer_responses = AnswerChoice.find_by_sql([<<-SQL, id])
            SELECT
                answer_choices.answer, COUNT(responses.answer_choice_id) AS num_responses
            FROM
                answer_choices
            LEFT OUTER JOIN
                responses
            ON
                responses.answer_choice_id = answer_choices.id
            WHERE answer_choices.question_id = 1
            GROUP BY answer_choices.id
            ORDER BY COUNT(responses.answer_choice_id) DESC
        SQL

        answer_responses.inject({}) do |results, ac|
            results[ac.answer] = ac.num_responses
            results
        end
        
    end

end