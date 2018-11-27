class AddHostToEvents < ActiveRecord::Migration
  def up
    add_column :events, :host_id, :integer, :default => 1
    add_foreign_key :events, :hosts
  end

  def down
    remove_column :events, :host_id, :integer
    remove_foreign_key :events, :hosts
  end
end
