# Replaces the unmaintained settingslogic gem (broken on Psych 4 / Ruby 3.1+).
# Exposes config/config.yml[Rails.env] with dot access, e.g. Setting.smtp_settings.port
class Setting
  def self.config
    @config ||= begin
      yaml = YAML.safe_load(ERB.new(File.read(Rails.root.join('config', 'config.yml'))).result, aliases: true)
      wrap(yaml.fetch(Rails.env))
    end
  end

  def self.wrap(value)
    return value unless value.is_a?(Hash)

    ActiveSupport::OrderedOptions.new.tap { |o| value.each { |k, v| o[k] = wrap(v) } }
  end

  def self.method_missing(name, *args, &block)
    config.key?(name) ? config[name] : super
  end

  def self.respond_to_missing?(name, include_private = false)
    config.key?(name) || super
  end
end
