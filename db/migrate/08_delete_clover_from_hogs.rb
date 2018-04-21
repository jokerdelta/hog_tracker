class DeleteCloverFromHogs < ActiveRecord::Migration
  def change
    execute('DELETE FROM hogs WHERE id= 1;')
  end
end
