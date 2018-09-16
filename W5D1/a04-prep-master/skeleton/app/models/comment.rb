# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  body       :text             not null
#  user_id    :integer          not null
#  link_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  validates :body, presence: true
  
  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User
    
  belongs_to :link,
    foreign_key: :link_id,
    class_name: :Link
end
