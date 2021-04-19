class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
    t.string :name
    t.string :street_name
    t.string :city
    t.string :state 
    t.integer :zip_code
    t.integer :contact
    t.boolean :family
    t.integer :user_id
  end

  end
end
