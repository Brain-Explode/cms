class AddUserRefToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :user
  end
end
