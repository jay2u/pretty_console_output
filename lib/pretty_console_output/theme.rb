module PrettyConsoleOutput
  class Theme

    attr_accessor :info_color
    attr_accessor :log_color
    attr_accessor :error_color
    attr_accessor :done_color
    attr_accessor :tag_text_color
    attr_accessor :tag_date_color
    attr_accessor :tag_bold
    attr_accessor :tag_underscore

    def initialize(options={})
      @info_color     = options.fetch(:info_color)     { :light_yellow }
      @log_color      = options.fetch(:log_color)      { :white }
      @error_color    = options.fetch(:error_color)    { :light_red }
      @done_color     = options.fetch(:done_color)     { :light_green }
      @tag_text_color = options.fetch(:tag_text_color) { :light_white }
      @tag_date_color = options.fetch(:tag_date_color) { :light_white }
      @tag_bold       = options.fetch(:tag_bold)       { true }
      @tag_underscore = options.fetch(:tag_underscore) { true }
    end
  end
end