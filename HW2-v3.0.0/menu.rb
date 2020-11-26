# frozen_string_literal: true

require 'yaml'
require_relative 'users/user'
require_relative 'users/admin'
require_relative 'users/superadmin'

class Menu
  def start
    init_user
  end

  def init_user
    users = YAML.load(File.read("db/users.yml"))
    until @user == 'guest' || @user == 'admin' || @user == 'super'
      p 'Введіть один із доступних логінів super, admin, guest? '
      @user = gets.chomp
      p 'Введіть пароль'
      @pass = gets.chomp.downcase
      users.each do |user, pass|
        login = @user.to_s if @user == user.to_s && @pass == pass
        File.open("db/session.yml", "w") { |file| file.write(@user.to_yaml) }
        Admin.new.start if login == 'admin'
        User.new.start if login == 'guest'
        SuperAdmin.new.start if login == 'super'
      end

    end

  end
end

Menu.new.start
