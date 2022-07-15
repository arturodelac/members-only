class ChangeColumnToUser < ActiveRecord::Migration[7.0]
  def change
    change_column :Users, :email, :text, unique:false
  end
end
