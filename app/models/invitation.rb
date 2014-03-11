# == Schema Information
#
# Table name: invitations
#
#  id              :integer          not null, primary key
#  sent            :boolean          default(FALSE)
#  access_level_id :integer
#  inviter_id      :integer
#  invitee_id      :integer
#  price           :integer
#  created_at      :datetime
#  updated_at      :datetime
#  paid            :boolean
#  accepted        :boolean          default(FALSE)
#

class Invitation < ActiveRecord::Base
  belongs_to :access_level
  belongs_to :inviter, class_name: "Partner"
  belongs_to :invitee, class_name: "Partner"

  validates :access_level, presence: true

  def deliver
    PartnerMailer.invitation(self.invitee, self).deliver
    self.sent = true
    self.save
  end

  def price
    from_cents read_attribute(:price)
  end

  def price=(value)
    write_attribute(:price, to_cents(value))
  end

  private

  def from_cents(value)
    (value || 0) / 100.0
  end

  def to_cents(value)
    if value.is_a? String then value.sub!(',', '.') end
    (value.to_f * 100).to_int
  end

end
