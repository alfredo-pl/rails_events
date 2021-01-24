class Crew < ApplicationRecord
  belongs_to :group

  def get_group_name
    self.group.name
  end
  
end
