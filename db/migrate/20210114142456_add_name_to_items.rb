class AddNameToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :user,                   null: false, foreign_key: true
    add_column    :items, :name,         :string,  null: false
    add_column    :items, :comment,      :text,    null: false
    add_column    :items, :category_id,  :integer, null: false
    add_column    :items, :condition_id, :integer, null: false
    add_column    :items, :carriage_id,  :integer, null: false
    add_column    :items, :pref_id,      :integer, null: false
    add_column    :items, :ship_date_id, :integer, null: false
    add_column    :items, :price,        :integer, null: false
  end
end
