Pretty Console Output ( for Ruby 2.x / Rails )
=================================================

[![Gem Version](https://badge.fury.io/rb/pretty_console_output.svg)](https://badge.fury.io/rb/pretty_console_output)
[![Build Status](https://travis-ci.org/guanting112/pretty_console_output.svg?branch=master)](https://travis-ci.org/guanting112/pretty_console_output)
[![Code Climate](https://codeclimate.com/github/guanting112/pretty_console_output/badges/gpa.svg)](https://codeclimate.com/github/guanting112/pretty_console_output)

Installation
--------

Via Rubygems

```shell
gem install pretty_console_output
```

In your Gemfile:

```ruby
gem 'pretty_console_output'
```

Usage
--------

![usage_output](http://i.imgur.com/NmZh9CR.png)

```ruby
require 'pretty_console_output' 

console = PrettyConsoleOutput::Console.new

console.tag "Reload Host files."
console.log "Start At: " + Time.now.localtime.to_s

console.tag "Check File Exists"
console.info 'Read .gitignore'
console.data IO.read('.gitignore')
console.error "sample.php Not Found"
console.error "upload/a05bf0.jpg Not Found"

console.tag "All Done"
console.done "OK: " + Time.now.to_s
```


LICENSE
--------

MIT LICENSE ( See LICENSE.txt ) 