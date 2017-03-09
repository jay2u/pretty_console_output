require "pretty_console_output/version"
require "pretty_console_output/color"
require "pretty_console_output/theme"

module PrettyConsoleOutput
  class Console
    def initialize(options={})
      options[:theme]  = {} if options[:theme].nil?
      options[:stdout] = $stdout if options[:stdout].nil?

      @color  = Color.new(options[:stdout])
      @theme  = Theme.new(options[:theme])
      @stdout = options[:stdout]
    end

    def puts(obj)
      @stdout.puts obj
    end

    def info(obj)
      string = obj.to_s

      puts @color.colorize("  ☞  #{string}", @theme.info_color)
    end

    def log(obj)
      string = obj.to_s

      puts @color.colorize("     #{string}", @theme.log_color)
    end

    def data(obj)
      string = obj.to_s

      puts @color.colorize("     #{string}".gsub(/\n/, "\n     "), @theme.log_color)
    end

    def error(obj)
      string = obj.to_s

      puts @color.colorize("  ✘  #{string}", @theme.error_color)
    end

    def done(obj)
      string = obj.to_s

      puts @color.colorize("  ✓  #{string}", @theme.done_color)
    end

    def tag(obj)
      start_tag_time

      time   = @color.colorize(elapsed_time_tag, @theme.tag_date_color)
      string = @color.colorize(obj, @theme.tag_text_color, bold: @theme.tag_bold, underscore: @theme.tag_underscore)

      puts "\n#{time} #{string}\n\n"
    end

    private

      def start_tag_time
        @start_tag_time ||= Time.now.to_i
      end

      def elapsed_time_tag
        elapsed_seconds = Time.now.to_i - start_tag_time

        ( elapsed_seconds / 60 ).to_s.rjust(2, '0') + ":" + ( elapsed_seconds % 60 ).to_s.rjust(2, '0')
      end
  end
end
