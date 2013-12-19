class WalkerBids < ActiveRecord::Base
  belongs_to :activities
  
  def get_activities_id
    read_attribute(:activities_id)
  end

  def set_activities_id(newid)
    self[:activities_id] = newid
  end

end
