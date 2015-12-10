require 'middleman'
require File.join(File.dirname(__FILE__), 'version')

class Breadcrumbs < Middleman::Extension
  include BreadcrumbsVersion
  def initialize(app, options_hash={}, &block)
    super
  end
end
