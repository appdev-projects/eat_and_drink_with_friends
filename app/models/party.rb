# == Schema Information
#
# Table name: parties
#
#  id          :integer          not null, primary key
#  address     :string
#  date        :date
#  description :text
#  time        :time
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Party < ApplicationRecord
    has_many(:gatherings, { :class_name => "Gathering", :foreign_key => "party_id", :dependent => :destroy })
    has_many(:foods, { :class_name => "Food", :foreign_key => "party_id", :dependent => :destroy })
    has_many(:drinks, { :class_name => "Drink", :foreign_key => "party_id", :dependent => :destroy })
    belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id"})
   
end
