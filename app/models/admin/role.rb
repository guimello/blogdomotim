class Admin::Role < ActiveRecord::Base
  ADMIN = :admin
  USER  = :user

  
  has_and_belongs_to_many :users,
                          :class_name => '::User',
                          :join_table => 'admin_roles_users',
                          # :association_foreign_key => 'user_id',
                          :foreign_key => 'admin_role_id'

  validates :name, :presence => true, :allow_blank => true, :length => { :minimum => 1, :maximum => 255 }

  def self.admin
    find_by_name ADMIN
  end

  def self.user
    find_by_name USER
  end
end
