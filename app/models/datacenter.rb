# == Schema Information
#
# Table name: datacenters
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  postcode   :string(255)
#  comment    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Datacenter < ActiveRecord::Base
  attr_accessible :address, :comment, :name, :postcode
  has_many :server
end
