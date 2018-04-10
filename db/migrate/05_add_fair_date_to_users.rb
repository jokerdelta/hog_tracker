class AddFairDateToUsers < ActiveRecord::Migration
  def change
      add_column :users, :fair_date, :string
  end
end
