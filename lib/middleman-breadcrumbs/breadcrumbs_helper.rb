require 'rack/utils'
require 'padrino-helpers'

module BreadcrumbsHelper
  def self.included(klass)
    klass.send(:include, Padrino::Helpers) unless klass.instance_methods.include? :link_to
  end

  def breadcrumbs(page)
    hierarchy = [page]
    hierarchy.unshift hierarchy.first.parent while hierarchy.first.parent
    hierarchy.collect {|page| link_to page.data.title, "/#{page.path}" }.join(h ' > ')
  end
end