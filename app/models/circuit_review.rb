class CircuitReview < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:circuit)
    belongs_to(:user)

    # ActiveRecord Validatons (See db schema for additional validators)
    validates(:title, presence: true)
    validates(:title, length: { in: 10..50 })
    validates(:content, presence: true)
    validates(:content, length: { in: 50..500 })
    validates(:rating, presence: true)
    validates(:rating, inclusion: { in: 0..5 })
    validates(:circuit_id, presence: true)
    validates(:circuit_id, numericality: { only_integer: true })
    validates(:user_id, presence: true)
    validates(:user_id, numericality: { only_integer: true })

    # Instance Methods
    def author_name
        self.user.full_name
    end

    def author_id
        self.user.id
    end

    def subject_name
        self.circuit.title
    end

    def subject_id
        self.circuit.id
    end

end