# frozen_string_literal: true

require 'yaml'
require_relative 'user'

class Menu
  def start
    init_user
  end

  def init_user
    users = YAML.load(File.read('db/users.yml'))
    until @user == 'guest' || @user == 'admin' || @user == 'super'
      p 'Введіть один із доступних логінів super, admin, guest? '
      @user = gets.chomp
      p 'Введіть пароль'
      @pass = gets.chomp.downcase
      users.each do |user, pass|
        log_in(pass, user)
      end
    end
  end

  private

  def log_in(pass, user)
    User.new.start if @user == user.to_s && @pass == pass
    File.open('db/session.yml', 'w') { |file| file.write(@user.to_yaml) }
  end
end

Menu.new.start
