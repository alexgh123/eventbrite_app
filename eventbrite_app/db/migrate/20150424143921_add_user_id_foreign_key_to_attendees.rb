class AddUserIdForeignKeyToAttendees < ActiveRecord::Migration
  def change
    add_reference :attendees, :user, index: true
    add_foreign_key :attendees, :users
  end
end
