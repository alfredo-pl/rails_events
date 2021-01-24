class Group < ApplicationRecord
    validates :name, :type_group, presence: true
    enum type_group: [:men, :women, :band]
    has_many :concerts
    has_many :crews
    
    #methods instance
    #quantity crew
    def cant_crew
        Crew.references(:groups).where(group_id: id).count
    end
    #first date
    def date_debut
       debut =Conciert.references(:groups).where(group_id: id).pluck :date
       debut.first
    end
    #quantity concierts
    def cant_concierts
        Conciert.references(:groups).where(group_id: id).count
    end
    #quantity people
    def cant_people
        people =Conciert.references(:groups).where(group_id: id).pluck :people
        people.sum
    end

    
end
