# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  phone_number    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many(:foods, { :class_name => "Food", :foreign_key => "user_id", :dependent => :destroy, inverse_of: :user}) 
  has_many(:drinks, { :class_name => "Drink", :foreign_key => "user_id", :dependent => :nullify, inverse_of: :user}) 
  has_many(:gatherings, { :class_name => "Gathering", :foreign_key => "user_id", :dependent => :destroy, inverse_of: :user}) 
  has_many(:parties, { :class_name => "Party", :foreign_key => "user_id", :dependent => :destroy, inverse_of: :user}) 
end
