class AddInviterToReservation < ActiveRecord::Migration
  def change
    add_reference :reservations, :inviter, index: true
    change_table :reservations do |t|
      t.rename :partner_id, :invitee_id
    end
  end
end
