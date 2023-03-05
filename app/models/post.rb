# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :integer
#  user_id    :integer
#
class Post < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "post_id", :dependent => :destroy })
  belongs_to(:topic, { :required => true, :class_name => "Topic", :foreign_key => "topic_id" })
end
