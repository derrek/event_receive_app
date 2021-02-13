class CreateStats < ActiveRecord::Migration[6.1]
  def change
    create_table :stats do |t|
      t.string :click
      t.string :view
      t.string :edit

      t.timestamps
    end
  end
end
