
class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.bigint :task_id
      t.string :name

      t.timestamps
    end
  end
end