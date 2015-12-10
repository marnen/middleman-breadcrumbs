![](https://travis-ci.org/marnen/middleman-breadcrumbs.svg)

# middleman-breadcrumbs

Breadcrumbs helper for Middleman

## Installation

Install the gem as usual: put `gem 'middleman-breadcrumbs'` in Gemfile, then run `bundle install`.

Put `activate :breadcrumbs` in config.rb (*not* in the `configure :build` block).

## Usage

In your view files, just call `breadcrumbs(current_page)` to display breadcrumbs.

### Options

#### `:separator`

The breadcrumb levels are separated with ` > ` by default. If you want a different separator, use the `:separator` option—e.g.,  `breadcrumbs(current_page, separator: '|||')`.

#### `:wrapper`

If you want to wrap each breadcrumb level in a tag, pass the tag name to the `:wrapper` option. For example, if you want your breadcrumbs in a list:

```erb
<ul>
  <%= breadcrumbs current_page, wrapper: :li, separator: nil %>
</ul>
```
This will wrap each breadcrumb level in a `<li>` element.
