class CreateMarios < ActiveRecord::Migration[7.1]
  def change
    create_table :marios do |t|
      t.string :Names

      t.timestamps
    end
  end
end
