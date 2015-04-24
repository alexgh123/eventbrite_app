class AddUserIdArrayToEvents < ActiveRecord::Migration
  def change
    add_column :events, :attendees, :array
  end
end
