class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.datetime :createtime
      t.datetime :updatetime
      t.references :user, index: true

      t.timestamps
    end
  end
end
