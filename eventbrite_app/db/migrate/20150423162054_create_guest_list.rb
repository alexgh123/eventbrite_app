class CreateGuestList < ActiveRecord::Migration
  def change
    create_table :guest_lists do |t|
      t.string :atire
    end
  end
end
