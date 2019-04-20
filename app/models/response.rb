class Response < ApplicationRecord
    validates :user_id, :answer_choice_id, presence: true
    validate :respondent_already_answered?
    validate :respondent_is_author?

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

    private
    def respondent_already_answered?
        answered = sibling_responses.where(user_id: self.user_id)
        if answered[0] != nil
            errors[:response] << 'can\'t answer same question twice'
        end
    end

    def respondent_is_author?
        if question.poll.author.id == respondent.id
            errors[:response] << 'author can\'t answer own question'
        end
    end

end