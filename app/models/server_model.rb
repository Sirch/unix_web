# == Schema Information
#
# Table name: server_models
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  manufacturer     :string(255)
#  uheight          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  power            :integer
#  power_sockets    :integer
#  heat_dissipation :integer
#

class ServerModel < ActiveRecord::Base
  attr_accessible :manufacturer, :name, :uheight, :power, :power_sockets, :heat_dissipation
  has_many :server
  has_many :server_rack, through: :server
  
  def self.get_id(search)
    if f=find( :all,
      conditions: [
        'upper(name) = upper(?)',
        "#{search}"
      ]).first
      f.id
    end
  end
  
  def servers?
    if self.server.count > 0
      true
    else
      false
    end
  end
end
