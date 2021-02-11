class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :event_type
      t.text :at
      t.string :button_color

      t.timestamps
    end
  end
end
