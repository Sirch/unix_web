# == Schema Information
#
# Table name: servers
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  virtual             :boolean
#  parent_id           :integer
#  datacenter_id       :integer
#  serial              :string(255)
#  server_rack_id      :integer
#  server_model_id     :integer
#  operating_system_id :integer
#  cpu_number          :integer
#  cpu_id              :integer
#  ram                 :integer
#  environment         :string(255)
#  responsible_team_id :integer
#  project_id          :integer
#  oob_address         :inet
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  usage               :string(255)
#  operating_system    :string(255)
#

class Server < ActiveRecord::Base
  attr_accessible {
    :cpu_id
    :cpu_number
    :datacenter_id
    :environment_id
    :server_model_id
    :name
    :oob_address
    :operating_system
    :parent_id
    :project_id
    :server_rack_id
    :ram
    :responsible_team_id
    :serial
    :serverusage_id
    :virtual
  }
  
  
  belongs_to :datacenter
  belongs_to :server_rack
  belongs_to :cpu
  has_many :child, :class_name => "Server", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Server"
  belongs_to :server_model
  belongs_to :project
  
  validates :name,  presence: true, length: { maximum: 50 }
  
  
  def self.operating_systems
    Server.pluck(:operating_system).uniq
  end
  
  def self.names
    Server.pluck(:name)
  end

end
