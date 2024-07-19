class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_date
      t.string :description

      t.timestamps
    end
  end
end
