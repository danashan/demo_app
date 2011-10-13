class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.integer :id
      t.string :title, :limit => 50

      t.timestamps
    end
  end
  
  def self.down
    drop_table :forums
end
end
