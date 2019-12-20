class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username 
      t.string :password_digest
      t.string :email
      t.string :name
      t.string :photo
      t.integer :age
      t.string :dob
      t.string :city_state
      t.string :about_me
      t.string :sex
      t.boolean :active  


      t.timestamps
    end
  end
end