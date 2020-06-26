class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :title
      t.text :location
      t.text :date
      t.string :description

      t.timestamps
    end
  end
end
