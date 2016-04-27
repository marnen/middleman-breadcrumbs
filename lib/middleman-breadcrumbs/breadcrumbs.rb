require 'middleman'
require File.join(File.dirname(__FILE__), 'version')
require 'rack/utils'
require 'padrino-helpers'

class Breadcrumbs < Middleman::Extension
  include BreadcrumbsVersion
  include Padrino::Helpers

  expose_to_template :breadcrumbs

  def initialize(app, options_hash={}, &block)
    super
  end

  def breadcrumbs(page, separator: ' > ', wrapper: nil)
    hierarchy = [page]
    hierarchy.unshift hierarchy.first.parent while hierarchy.first.parent
    hierarchy.collect {|page| wrap link_to(page.data.title, "/#{page.path}"), wrapper: wrapper }.join(h separator)
  end

  private

  def wrap(content, wrapper: wrapper)
    wrapper ? content_tag(wrapper) { content } : content
  end
end
