class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :activity_name
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :finished
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
