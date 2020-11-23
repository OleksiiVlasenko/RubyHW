require 'yaml'
require_relative 'users/user'
require_relative 'users/admin'
require_relative 'users/superadmin'

class Setting

  CONFIG_FILE = 'settings.yml'

  class << self

    def get(key)
      load_settings[key.to_s]['value']
    end

    def load_settings
      @config ||= YAML.load(File.read(file_path))
    end

    private

    def file_path
      "config/#{CONFIG_FILE}"
    end

  end

end

class Menu

  def start
    init_user
  end

  def init_user
    until @user == 'guest' || @user == 'admin' || @user == 'super'
      p 'Введіть один із доступних логінів super(superadmin), admin, guest? '
      @user = gets.chomp
      p 'Введіть пароль'
      @pass = gets.chomp.downcase
      if @user == 'guest' && @pass == 'guest'
        @guest = User.new.start
      elsif @user == 'admin' && @pass == 'admin'
        @super = SuperAdmin.new.start
      elsif @user == 'super' && @pass == 'super'
        @super = SuperAdmin.new.start
      else
        p 'Вибачте спробуйте ще!'
      end
    end
  end
end

Menu.new.start
