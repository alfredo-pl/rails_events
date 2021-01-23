class Group < ApplicationRecord
    validates :name, :type, presence: true
    enum type: [:men, :women, :band]
    has_many :concerts
    has_many :crews
end
