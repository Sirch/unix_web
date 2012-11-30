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
#  cpu_number          :integer
#  cpu_id              :integer
#  ram                 :integer
#  environment         :string(255)
#  responsible_team_id :integer
#  project_id          :integer
#  oob_address         :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  usage               :string(255)
#  operating_system    :string(255)
#  added_by            :integer
#  edited_by           :integer
#  cpu_type            :string(255)
#

class Server < ActiveRecord::Base
  attr_accessible(
    :cpu,
    :cpu_id,
    :cpu_number,
    :datacenter_id,
    :environment,
    :environment_id,
    :name,
    :oob_address,
    :operating_system,
    :parent,
    :parent_id,
    :project,
    :project_id,
    :model,
    :server_model_id,
    :rackname,
    :server_rack_id,
    :ram,
    :responsible_team_id,
    :serial,
    :usage,
    :virtual,
    :added_by,
    :edited_by
    )
  
  
  belongs_to :datacenter
  belongs_to :server_rack
  belongs_to :cpu
  has_many :child, :class_name => "Server", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Server"
  belongs_to :server_model
  belongs_to :project
  belongs_to :creator, class_name: "User", foreign_key: "added_by"
  belongs_to :editor, class_name: "User", foreign_key: "edited_by"
  
  validates :name,  presence: true, length: { maximum: 50 }
  validates_uniqueness_of :name, case_sensitive: false
  validates :datacenter_id, presence: true
  validates :server_rack_id, presence: true
  validates :project_id, presence: true
  
  
  def self.operating_systems
    Server.pluck(:operating_system).uniq
  end
  
  def self.names
    Server.pluck(:name).sort
  end
  
  def self.get_id(search)
  
    if f=find( :all,
      conditions: [
        'upper(name)=upper(?)',
        "#{search}"
      ]).first
      f.id
    end
  end
  
  def children?
    
    if self.child.count > 0
      true
    else
      false
    end
  end

end
