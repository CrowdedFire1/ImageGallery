class AddConstraintsToUserModel < ActiveRecord::Migration[8.0]
  def change
    change_column_null :users, :email, false
  end
end
