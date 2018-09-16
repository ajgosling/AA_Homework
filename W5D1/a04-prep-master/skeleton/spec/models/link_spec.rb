# == Schema Information
#
# Table name: links
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
  it 'should validate that :user cannot be empty/falsy' do
    should validate_presence_of(:user).with_message(/must exist|can't be blank/)
  end
  it { should belong_to(:user).class_name(:User) }
  it { should have_many(:comments).class_name(:Comment) }
end
