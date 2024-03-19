class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :post_title
      t.text :post_body
      t.belongs_to :member, index: true, foreign_key:

      t.timestamps
    end
  end
end
