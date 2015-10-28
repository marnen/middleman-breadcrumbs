middleman-breadcrumbs
=====================

Breadcrumbs helper for Middleman

Usage
-----

In config.rb: `activate :breadcrumbs`.

In your view files, just call `breadcrumbs(current_page)`. By default this will separate the breadcrumb levels with ` > `; if you want a different separator, call `breadcrumbs(current_page, separator: '|||')`
