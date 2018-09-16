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

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should validate_presence_of(:body) }
  it 'should validate that :user cannot be empty/falsy' do
    should validate_presence_of(:user).with_message(/must exist|can't be blank/)
  end
  it 'should validate that :link cannot be empty/falsy' do
    should validate_presence_of(:link).with_message(/must exist|can't be blank/)
  end
  it { should belong_to(:user).class_name(:User) }
  it { should belong_to(:link).class_name(:Link) }
end
