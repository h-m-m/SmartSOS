class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.belongs_to :campaign
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
