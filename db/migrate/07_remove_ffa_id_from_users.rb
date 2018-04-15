class RemoveFfaIdFromUsers < ActiveRecord::Migration
  def change
      remove_column :users, :ffa_id
  end
end
