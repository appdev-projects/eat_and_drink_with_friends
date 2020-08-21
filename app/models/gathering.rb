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


   

end
