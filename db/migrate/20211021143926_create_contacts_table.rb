class CreateContactsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.datetime :birth_date, null: false
      t.string :phone, null: false
      t.text :address, null: false
      t.string :cc, null: false
      t.string :cc_franchise, null: false
      t.string :email, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
