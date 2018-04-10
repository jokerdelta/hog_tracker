class CreateFfas < ActiveRecord::Migration
  def change
      create_table :FFAs do |t|
        t.string :chapter
        t.string :address
      end
  end

end
