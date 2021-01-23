class Group < ApplicationRecord
    validates :name, :type_group, presence: true
    enum type_group: [:men, :women, :band]
    has_many :concerts
    has_many :crews
end
