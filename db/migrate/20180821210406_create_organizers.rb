class CreateOrganizers < ActiveRecord::Migration[5.0]
  def change
    create_table :organizers do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :email_address
      t.string :phone_number
    end
  end
end
