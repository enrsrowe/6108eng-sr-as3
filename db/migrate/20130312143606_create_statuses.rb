class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :title,        :null => false
      t.integer :position,  :null => false

      t.timestamps
    end
  end
end
