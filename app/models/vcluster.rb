# == Schema Information
#
# Table name: vclusters
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vcluster < ActiveRecord::Base
  attr_accessible :comment, :name
end
