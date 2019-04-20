class Response < ApplicationRecord
    validates :user_id, :answer_choice_id, presence: true

    belongs_to(
        :answer_choice,
        class_name: 'AnswerChoice',
        foreign_key: :answer_choice_id,
        primary_key: :id
    )

    belongs_to(
        :respondent,
        class_name: 'User',
        foreign_key: :user_id,
        primary_key: :id
    )

    has_one :question, through: :answer_choice, source: :question

    def sibling_responses
        question.responses.where.not(id: self.id)
    end

    def respondent_already_answered?
        answered = sibling_responses.where(user_id: self.user_id)
        answered[0] != nil
    end

end