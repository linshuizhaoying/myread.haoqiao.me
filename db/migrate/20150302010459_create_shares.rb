class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string :title
      t.text :link
      t.text :limit
      t.datetime :createtime
      t.datetime :updatetime
      t.references :user, index: true

      t.timestamps
    end
  end
end
