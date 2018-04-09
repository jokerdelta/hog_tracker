class CreateWeights < ActiveRecord::Migration

  def change
    create_table :weights do |t|
      t.integer :week_1
      t.integer :week_2
      t.integer :week_3
      t.integer :week_4
      t.integer :week_5
      t.integer :week_6
      t.integer :week_7
      t.integer :week_8
      t.integer :week_9
      t.integer :week_10
      t.integer :week_11
      t.integer :week_12
      t.integer :week_13
      t.integer :week_14
      t.integer :week_15
      t.integer :hog_id
    end
  end

end
