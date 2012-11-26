# == Schema Information
#
# Table name: changes
#
#  id         :integer          not null, primary key
#  added_by   :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  subject    :text
#

require 'spec_helper'

describe Change do
  pending "add some examples to (or delete) #{__FILE__}"
end
