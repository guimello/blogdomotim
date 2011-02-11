class CreateAdminRoles < ActiveRecord::Migration
  def self.up
    create_table :admin_roles do |t|
      t.string :name, :null => false

      t.timestamps
    end

    [ Admin::Role::ADMIN, Admin::Role::USER, Admin::Role::AUTHOR ].each { |role| Admin::Role.create! :name => role }
  end

  def self.down
    drop_table :admin_roles
  end
end
