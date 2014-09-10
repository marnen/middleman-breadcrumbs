require 'padrino-helpers'

module BreadcrumbsHelper
  include Padrino::Helpers

  def breadcrumbs(page)
    hierarchy = [page]
    hierarchy.unshift hierarchy.first.parent while hierarchy.first.parent
    hierarchy.collect {|page| link_to page.data.title, page.data.path }.join(h ' > ')
  end
end