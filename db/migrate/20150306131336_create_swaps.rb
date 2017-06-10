class CreateSwaps < ActiveRecord::Migration
  def change
    create_table :swaps do |t|
      t.string :title
      t.string :age
      t.text :extent
      t.text :want_book
      t.integer :state
      t.string :guest_id
      t.integer :check
      t.references :user, index: true

      t.timestamps
    end
  end
end
