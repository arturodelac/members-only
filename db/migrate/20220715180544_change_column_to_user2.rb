class ChangeColumnToUser2 < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        remove_index :Users, :email
        add_index :Users, :email
      end
    
      dir.down do
        remove_index :Users, :email
        add_index :Users, :email, unique: false
      end
    end
  end
end
