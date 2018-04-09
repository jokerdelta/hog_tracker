class CreateHogs < ActiveRecord::Migration

  def change
    create_table :hogs do |t|
      t.string :name
      t.integer :user_id
    end
  end

end
