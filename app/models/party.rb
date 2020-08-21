# == Schema Information
#
# Table name: parties
#
#  id          :integer          not null, primary key
#  date        :date
#  description :text
#  time        :time
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Party < ApplicationRecord
end
