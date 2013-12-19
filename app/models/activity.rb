class Activity < ActiveRecord::Base
  has_many :walker_bid

  def get_client_id
    read_attribute(:client_id)
  end

end
