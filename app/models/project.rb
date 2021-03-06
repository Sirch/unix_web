# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment    :string(255)
#

class Project < ActiveRecord::Base
  attr_accessible :name, :comment
  has_many :server
  
  validates :name,  presence: true, 
                    length: { maximum: 50 }, 
                    uniqueness: { case_sensitive: false }
                    
  def self.names
    Project.select(:name).map {|x| x.name }
  end
  
  def self.get_id(search)
    if f=find( :all,
      conditions: [
        'upper(name) = upper(?)',
        "#{search}"
      ]).first
      f.id
    end
  end
  
end
