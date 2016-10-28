class AddStatusToNotifis < ActiveRecord::Migration[5.0]
  def change
    add_column :notifis, :status, :boolean
  end
end
