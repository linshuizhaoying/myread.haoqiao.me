class CreateAllinfos < ActiveRecord::Migration
  def change
    create_table :allinfos do |t|
      t.string :title
      t.string :price
      t.string :url
      t.string :max
      t.datetime :start_time
      t.datetime :finish_time
      t.references :user, index: true

      t.timestamps
    end
  end
end
