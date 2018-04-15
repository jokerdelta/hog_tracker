class RemoveFfas < ActiveRecord::Migration
  def change
      drop_table :FFAs
  end
end
