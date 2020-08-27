# == Schema Information
#
# Table name: gatherings
#
#  id         :integer          not null, primary key
#  rsvp       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  party_id   :integer
#  user_id    :integer
#
class Gathering < ApplicationRecord
    belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })
    belongs_to(:party, { :required => false, :class_name => "Party", :foreign_key => "party_id" })
    validate :unique_combination
    validates :user, presence: true
    validates :party, presence: true

  def unique_combination
    Gathering.exists?(
      :party_id => self.party_id,
      :user_id => self.user_id
    )
  end
  
end
