# frozen_string_literal: true
require 'yaml'
require_relative 'users/user'
require_relative 'users/admin'
require_relative 'users/superadmin'
require_relative 'yaml_db'

class Menu

  def start
    init_user
  end

  def init_user
    guest = Setting.get_pass('guest')
    admin = Setting.get_pass('admin')
    super_admin = Setting.get_pass('super_admin').to_s
    until @user == 'guest' || @user == 'admin' || @user == 'super'
      p 'Введіть один із доступних логінів super(superadmin), admin, guest? '
      @user = gets.chomp
      p 'Введіть пароль'
      @pass = gets.chomp.downcase
      if @user == 'guest' && @pass == guest
        @guest = User.new.start
      elsif @user == 'admin' && @pass == admin
        @super = SuperAdmin.new.start
      elsif @user == 'super' && @pass == super_admin
        @super = SuperAdmin.new.start
      else
        p 'Вибачте спробуйте ще!'
      end
    end
  end
end

Menu.new.start
