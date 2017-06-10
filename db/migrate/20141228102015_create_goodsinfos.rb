class CreateGoodsinfos < ActiveRecord::Migration
  def change
    create_table :goodsinfos do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
