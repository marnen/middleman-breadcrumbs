# middleman-breadcrumbs

Breadcrumbs helper for Middleman

## Usage

In config.rb: `activate :breadcrumbs`.

In your view files, just call `breadcrumbs(current_page)`.

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
