require 'minitest/autorun'
begin
  require 'byebug'
rescue LoadError
  require 'debugger'
end
require 'middleman'
require 'faker'
