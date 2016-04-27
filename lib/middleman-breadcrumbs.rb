Dir[File.join File.dirname(__FILE__), 'middleman-breadcrumbs', '**', '*.rb'].each {|file| puts file; require file }

::Middleman::Extensions.register :breadcrumbs, Breadcrumbs
