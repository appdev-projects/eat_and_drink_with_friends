# == Schema Information
#
# Table name: drinks
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  party_id   :integer
#  user_id    :integer
#
class Drink < ApplicationRecord
end
