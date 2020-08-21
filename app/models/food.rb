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
end
