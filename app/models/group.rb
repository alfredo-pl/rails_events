class Group < ApplicationRecord
    validates :name, :type_group, presence: true
    enum type_group: [:men, :women, :band]
    has_many :concierts, dependent: :destroy
    has_many :crews, dependent: :destroy

    
    #methods instance
    #quantity crew
    def cant_crew
        Crew.references(:groups).where(group_id: id).count
    end
    #first date
    def date_debut
       debut =Conciert.references(:groups).where(group_id: id).order(date: :asc).first
       debut.date
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

    def cant_concierts_month
        time= Time.now.strftime("%Y-%m-01")
        t =Time.now.strftime("%Y-%m-%d")
        Conciert.references(:groups).where(group_id: id).where(date: time..t).count
    end
    def last_conciert
        last=Conciert.references(:groups).where(group_id: id).order(date: :desc).first
        last.date
    end

    def max_people
        max = Conciert.references(:groups).where(group_id: id).pluck :people
        max.max
    end
    def max_duration
        duration = Conciert.references(:groups).where(group_id: id).pluck :duration
        duration.max.strftime("%Hh:%Mm")
    end
end
