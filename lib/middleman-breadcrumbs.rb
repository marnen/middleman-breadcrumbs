Dir[File.join File.dirname(__FILE__), 'middleman-breadcrumbs', '**', '*.rb'].each {|file| puts file; require file }

Breadcrumbs.helpers BreadcrumbsHelper

::Middleman::Extensions.register :breadcrumbs, Breadcrumbs