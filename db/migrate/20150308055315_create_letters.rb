class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :title
      t.string :from_id
      t.string :belong_id
      t.text :content
      t.integer :state
      t.references :user, index: true

      t.timestamps
    end
  end
end
