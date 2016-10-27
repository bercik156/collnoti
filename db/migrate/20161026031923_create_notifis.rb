class CreateNotifis < ActiveRecord::Migration[5.0]
  def change
    create_table :notifis do |t|
      t.text :description
      t.references :category, foreign_key: true
      t.string :email
      t.integer :cost
      t.datetime :deadline

      t.timestamps
    end
  end
end
