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
end
