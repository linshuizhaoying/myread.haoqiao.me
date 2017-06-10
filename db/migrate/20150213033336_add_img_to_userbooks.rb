class AddImgToUserbooks < ActiveRecord::Migration
  def change
    add_column :userbooks, :img, :string
  end
end
