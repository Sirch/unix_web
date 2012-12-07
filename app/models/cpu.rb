# == Schema Information
#
# Table name: cpus
#
#  id             :integer          not null, primary key
#  processor      :string(255)
#  model          :string(255)
#  core_count     :integer
#  base_speed_mhz :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Cpu < ActiveRecord::Base
  attr_accessible :base_speed_mhz, :core_count, :model, :processor
end
