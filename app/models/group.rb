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
        no = "No ha debutado"
       debut =Conciert.references(:groups).where(group_id: id).order(date: :asc).first
       if debut.nil?
        no
       else
        debut.date
       end

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
        no = "No tiene concierto"
        last=Conciert.references(:groups).where(group_id: id).order(date: :desc).first
        if last.nil?
            no
        else
            last.date.strftime("%Y-%B-%A")
        end
    end

    def max_people
        no = "0"
        max = Conciert.references(:groups).where(group_id: id).pluck :people
        if max.blank?
            no
        else
            max.max
        end
    end
    def max_duration
        no = "0"
        duration = Conciert.references(:groups).where(group_id: id).pluck :duration
        
        if duration.blank?
            no
        else
            duration.max.strftime("%Hh:%Mm")
        end
    end
    def get_crews
        no = "0"
        crew= Crew.references(:groups).where(group_id: id).pluck :name
        
        if crew.blank?
            no
        else
            crew.join(", ")
        end
    end
end
