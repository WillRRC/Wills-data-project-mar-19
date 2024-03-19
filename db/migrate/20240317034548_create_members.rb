class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
