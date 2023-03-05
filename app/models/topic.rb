# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Topic < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  has_many(:posts, { :class_name => "Post", :foreign_key => "topic_id", :dependent => :destroy })

end
