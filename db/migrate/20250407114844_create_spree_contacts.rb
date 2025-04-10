class CreateSpreeContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :spree_contacts do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :message
      t.string :phone

      t.timestamps
    end
  end
end
