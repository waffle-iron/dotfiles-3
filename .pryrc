# Show Ruby /  Rails Version. Set color
Pry.config.color = true

Pry.config.prompt = proc do |obj, nest_level, _pry_|
version = ''
version << "Rails#{Rails.version}" if defined? Rails
version << "\001\e[0;31m\002"
version << "#{RUBY_VERSION}"
version << "\001\e[0m\002"

"#{version} #{Pry.config.prompt_name}(#{Pry.view_clip(obj)})> "
end

# For hirb
begin
  require 'hirb'
rescue LoadError
  # Missing goodies, bummer
end

if defined? Hirb
  # Slightly dirty hack to fully support in-session Hirb.disable/enable toggling
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry.config.print
      Pry.config.print = proc do |*args|
        Hirb::View.view_or_page_output(args[1]) || @old_print.call(*args)
      end
    end

    def disable_output_method
      Pry.config.print = @old_print
      @output_method = nil
    end
  end

  Hirb.enable
end

# For awesome_print
require "awesome_print"
AwesomePrint.pry!
