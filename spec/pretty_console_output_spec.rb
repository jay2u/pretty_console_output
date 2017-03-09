require 'minitest/autorun'
require 'pretty_console_output'

describe PrettyConsoleOutput do

  describe '測試 PrettyConsoleOutput::Console 的運作 ' do
    it '測試 tag 輸出，tag date 是否為 00:00' do
      fake_stdout = StringIO.new
      console = PrettyConsoleOutput::Console.new(stdout: fake_stdout)
      console.tag("TEST")

      fake_stdout.string.must_equal("\n00:00 TEST\n\n")
    end
  end

  describe '測試系統的 PrettyConsoleOutput::Theme 的設定是否有問題' do
    it '指定 done_color 為 :light_blue，當取得 done_color 的結果應該要一致' do
      theme = PrettyConsoleOutput::Theme.new(done_color: :light_blue)
      theme.done_color.must_equal(:light_blue)
    end
  end

  describe '測試系統的 PrettyConsoleOutput::Color 的運作狀況' do
    it '如果 stdout 為 string io 建立的，應該無法上色' do
      fake_stdout = StringIO.new
      color = PrettyConsoleOutput::Color.new(fake_stdout)

      color.colorize("國語字典ABCDE0123", :blue).must_equal("國語字典ABCDE0123")
    end

    it '如果 stdout 為 global stdout io 並走 shell 執行，應該可以上色' do
      color = PrettyConsoleOutput::Color.new($stdout)

      color.colorize("國語字典ABCDE0123", :blue).must_equal("\e[0;34;49m國語字典ABCDE0123\e[0m")
    end
  end

end