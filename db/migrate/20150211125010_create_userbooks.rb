class CreateUserbooks < ActiveRecord::Migration
  def change
    create_table :userbooks do |t|
      t.string :title
      t.text :body
      t.text :desc
      t.datetime :createtime
      t.datetime :updatetime
      t.references :user, index: true

      t.timestamps
    end
  end
end
