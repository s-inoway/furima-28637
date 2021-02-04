class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :purchase, null: false, foreign_key: true
      t.string     :zip_code, null: false
      t.integer    :pref_id,  null: false
      t.string     :city,     null: false
      t.string     :chome,    null: false
      t.string     :bldg
      t.string     :tel,      null: false
      t.timestamps
    end
  end
end
