################################################################################
namespace :users do  
  ################################################################################
  desc 'Creates users in the system eg._ADMIN=foo@bar.com _USER=lol@wut.com _AUTHOR=jizzed@pants.com'
  task :add => :environment do
    password      = 'pa$$w0rd'
    admin_emails  = (ENV['_ADMIN'] || '').split(',').map   &:strip
    user_emails   = (ENV['_USER'] || '').split(',').map    &:strip
    author_emails = (ENV['_AUTHOR'] || '').split(',').map  &:strip

    admin_emails.each do |email|
      user = RakeUserHelper.build_user email, password
      user.save!
      user.roles << Admin::Role.admin

      User.confirm_by_token user.confirmation_token
    
      puts "Usuario ADMIN #{email} adicionado e confirmado com sucesso."
    end

    user_emails.each do |email|
      user = RakeUserHelper.build_user email, password
      user.save!

      User.confirm_by_token user.confirmation_token
    
      puts "Usuario USER #{email} adicionado e confirmado com sucesso."
    end

    author_emails.each do |email|
      user = RakeUserHelper.build_user email, password
      user.save!
      user.roles << Admin::Role.admin

      User.confirm_by_token user.confirmation_token
    
      puts "Usuario AUTHOR #{email} adicionado e confirmado com sucesso."
    end

    puts '======DONE======'
  end

  module RakeUserHelper
    def self.build_user(email, password)
      User.new  :email                  => email,
                :password               => password,
                :password_confirmation  => password,
                :name                   => email,
                :birthday               => '23/01/1985'

    end
  end
end
