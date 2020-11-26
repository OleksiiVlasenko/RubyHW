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
        if @user == user.to_s && @pass == pass
          @guest = User.new.start
        elsif user.to_s == @user && pass == @pass
          @super = SuperAdmin.new.start
        elsif user.to_s == @user && pass == @pass
          @super = SuperAdmin.new.start
        else
          p 'Вибачте спробуйте ще!'
        end
      end
    end
  end
end

Menu.new.start
