class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string  :task_title, null: false
      t.date    :task_time, null: false
      t.text    :task_memo, null: false

      t.timestamps
    end
  end
end
