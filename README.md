![](https://travis-ci.org/marnen/middleman-breadcrumbs.svg)

# middleman-breadcrumbs

Breadcrumbs helper for [Middleman](https://middlemanapp.com/)

## Installation

Install the gem as usual: put `gem 'middleman-breadcrumbs'` in Gemfile, then run `bundle install`.

Put `activate :breadcrumbs` in config.rb (*not* in the `configure :build` block).

## Configuration

This gem has two configuration options, which are set in the [usual way for Middleman extensions](https://middlemanapp.com/advanced/configuration/#configuring-extensions).

<dl>
  <dt>`:separator`</dt>
  <dd>String that separates the breadcrumb levels. Default is ` > `.</dd>
  <dt>`:wrapper`</dt>
  <dd>Tag name (as a symbol) in which to wrap each breadcrumb level. Default is `nil`, which means no wrapping.</dd>
</dl>

For example, if you wanted to wrap the breadcrumb levels in `<li>` elements and separate them with bullets, you would put the following in `config.rb`:

```ruby
activate :breadcrumbs, separator: ' • ', wrapper: :li
```


## Usage

In your view files, just call `breadcrumbs(current_page)` to display breadcrumbs. If you want to override the separator or wrapper defined in the `config.rb` file, pass the appropriate options to the `breadcrumbs` method:

```erb
<%= breadcrumbs(current_page, separator: ' ||| ', wrapper: :div) %>
```
