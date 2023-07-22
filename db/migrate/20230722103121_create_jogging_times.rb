class CreateJoggingTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :jogging_times do |t|
      t.float :time
      t.float :distance
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
