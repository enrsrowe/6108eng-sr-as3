class CreateMyFlickrs < ActiveRecord::Migration
  def change
    create_table :my_flickrs do |t|

      t.timestamps
    end
  end
end
