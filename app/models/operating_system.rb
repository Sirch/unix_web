# == Schema Information
#
# Table name: operating_systems
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  version    :string(255)
#  release    :string(255)
#  comment    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OperatingSystem < ActiveRecord::Base
  attr_accessible :comment, :name, :release, :version
  has_many :server
end
