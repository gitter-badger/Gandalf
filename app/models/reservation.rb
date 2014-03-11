# == Schema Information
#
# Table name: reservations
#
#  id              :integer          not null, primary key
#  invitee_id      :integer
#  access_level_id :integer
#  price           :integer
#  paid            :integer
#  count           :integer
#  created_at      :datetime
#  updated_at      :datetime
#  inviter_id      :integer
#

class Reservation < ActiveRecord::Base
  belongs_to :inviter, class_name: "Partner"
  belongs_to :invitee, class_name: "Partner"
  belongs_to :access_level
end
