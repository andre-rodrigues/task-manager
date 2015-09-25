class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.timestamp :start_at
      t.timestamp :end_at
      t.text :description

      t.timestamps null: false
    end
  end
end
