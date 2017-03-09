module PrettyConsoleOutput
  class Color
    COLOR_CODES = {
      black:         30,
      red:           31,
      green:         32,
      yellow:        33,
      blue:          34,
      magenta:       35,
      cyan:          36,
      white:         37,
      light_black:   90,
      light_red:     91,
      light_green:   92,
      light_yellow:  93,
      light_blue:    94,
      light_magenta: 95,
      light_cyan:    96,
      light_white:   97
    }.freeze

    def initialize(output)
      @output = output
    end

    def colorize(obj, color, mode={})
      string = obj.to_s

      return string unless colorize?
      return string unless COLOR_CODES[color]

      result = mode[:bold] ? "\e[1;" : "\e[0;"
      result << "4;" unless mode[:underscore].nil?
      result << COLOR_CODES[color].to_s
      result << ";49m#{string}\e[0m"
    end

    def colorize?
      (@output.respond_to?(:tty?) && @output.tty?)
    end
  end
end
