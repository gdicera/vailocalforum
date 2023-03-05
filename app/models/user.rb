# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  profile_picture :string
#  school_name     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:posts, { :class_name => "Post", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:topics, { :class_name => "Topic", :foreign_key => "user_id" })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "commenter_id", :dependent => :destroy })
  
  mount_uploader :profile_picture, ImageUploader
end
