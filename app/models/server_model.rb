# == Schema Information
#
# Table name: server_models
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  manufacturer :string(255)
#  uheight      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ServerModel < ActiveRecord::Base
  attr_accessible :manufacturer, :name, :uheight
  has_many :server
end
