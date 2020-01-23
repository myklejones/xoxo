class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.boolean :read, :default => false
      t.references :user, index: true, foreign_key: true
      t.references :conversation, index: true
      t.timestamps
      # t.references :message_reciever, index: true, class_name: 'User', foreign_key: true
    end
    # add_foreign_key :messages, :users, column: :message_reciever_id
    # add_index :messages,[:user_id, :message_reciever_id]
  end
end
   