# frozen_string_literal: true

class AddUsernameToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :username, :string
    change_column :users, :username, :string, null: false
    add_index :users, :username, unique: true
  end

  def down
    remove_index :users, :username
    remove_column :users, :username
  end
end
