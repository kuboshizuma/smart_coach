class CreateChatMessages < ActiveRecord::Migration
  def change
    create_table :chat_messages do |t|
      t.text :message
      t.integer :message_type
      t.references :room
      t.references :talker

      t.timestamps null: false
    end
  end
end
