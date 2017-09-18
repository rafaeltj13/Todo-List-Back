class Task < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :difficulty, presence: true
    validates :priority, presence: true
end
