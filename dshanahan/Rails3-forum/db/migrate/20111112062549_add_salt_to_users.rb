class AddSaltToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :salt, :string
  end
  def self.down
  remove_columm :users, :salt, :string
end
