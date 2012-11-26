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

class Change < ActiveRecord::Base
  attr_accessible :added_by, :content, :subject
  
  belongs_to :user
  
  def self.search(search)
    find( :all, 
          conditions: [
              'subject LIKE ? OR content LIKE ?', 
                "%#{search}%", 
                "%#{search}%"
                ],
           order: "id DESC" 
           )
  end
end
