class CreateOneinfos < ActiveRecord::Migration
  def change
    create_table :oneinfos do |t|
      t.string :joined_id
      t.references :allinfo, index: true

      t.timestamps
    end
  end
end
