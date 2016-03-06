class DropMailboxerConversations < ActiveRecord::Migration
  def change
    #Tables
        remove_foreign_key "mailboxer_receipts", :name => "receipts_on_notification_id"
        remove_foreign_key "mailboxer_conversation_opt_outs", :name => "mb_opt_outs_on_conversations_id"
      remove_foreign_key "mailboxer_notifications", :name => "notifications_on_conversation_id"

    #Indexes
      drop_table :mailboxer_conversation_opt_outs
      drop_table :mailboxer_receipts
      drop_table :mailboxer_conversations
      drop_table :mailboxer_notifications
  end
end
