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

require 'spec_helper'

describe Server do
  pending "add some examples to (or delete) #{__FILE__}"
end
