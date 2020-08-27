# == Schema Information
#
# Table name: foods
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  party_id    :integer
#  user_id     :integer
#
class Food < ApplicationRecord
    belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })
    belongs_to(:party, { :required => false, :class_name => "Party", :foreign_key => "party_id" })
    validates :user, presence: true
    validates :party, presence: true
    validates :name, presence: true
    validates :description, presence: true
end
