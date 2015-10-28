require 'middleman'

class Breadcrumbs < Middleman::Extension
  include BreadcrumbsVersion
  def initialize(app, options_hash={}, &block)
    super
  end
end
