class CreateUsersHaveAndBelongToManyAdminRole < ActiveRecord::Migration
  def self.up
    create_table :admin_roles_users, :id => false do |t|
      t.references :admin_role, :user, :null => false
    end

    add_index :admin_roles_users, [:admin_role_id, :user_id], :uniq => true
  end

  def self.down
    drop_table :admin_roles_users
  end
end
