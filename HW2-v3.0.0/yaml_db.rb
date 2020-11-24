class Setting
  CONFIG_FILE = 'settings.yml'
  class << self
    def get_pass(key)
      load_settings[key.to_s]['password']
    end

    def get_role(key)
      load_settings[key.to_s]['role']
    end

    def load_settings
      @config ||= YAML.load(File.read(file_path))
    end

    def update(params, role)
      settings = load_settings
      params.each do |key, value|
        key = key.to_s
        settings[key]['value'] = value.to_s if has_access?(role, key)
      end
      save_settings(settings)
    end

    def has_access?(role, key)
      return unless setting = load_settings[key]
      role >= setting['role']
    end

    private
    def file_path
      "users/#{CONFIG_FILE}"
    end
  end
end