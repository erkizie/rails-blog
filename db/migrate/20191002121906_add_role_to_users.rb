class AddRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    def change
      add_column :users, :role, :integer
    end
  end
end
