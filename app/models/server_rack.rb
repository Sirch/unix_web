# == Schema Information
#
# Table name: server_racks
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  datacenter_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ServerRack < ActiveRecord::Base
  attr_accessible :datacenter_id, :name
  has_many :server
  belongs_to :datacenter
  
  def self.get_id(datacenter_id, search)
    if f=find( :all,
      conditions: [
        'datacenter_id=? AND name=?',
        "#{datacenter_id}",
        "#{search}"
      ]).first
      f.id
    end
  end
end
