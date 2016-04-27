require_relative './spec_helper'
require 'ostruct'
require 'middleman-breadcrumbs/breadcrumbs'

describe Breadcrumbs do
  before do
    app = Minitest::Mock.new
    [:after_configuration, :initialized, :instance_available].each do |method|
      app.expect method, true
    end
    @helper = Breadcrumbs.new app
  end

  it 'includes Padrino::Helpers' do
    Breadcrumbs.must_include Padrino::Helpers
  end

  describe '#breadcrumbs' do
    before do
      self.singleton_class.send :include, Padrino::Helpers
      @page = page
    end

    describe 'top-level page' do
      it 'returns a link to the page' do
        @helper.breadcrumbs(@page).must_equal link_to(@page.data.title, "/#{@page.path}")
      end
    end

    describe 'non-top-level page' do
      before do
        @parent = page
        @grandparent = page
        @page.parent = @parent
        @page.parent.parent = @grandparent
      end

      describe 'separator' do
        describe 'specified' do
          it 'joins all links to parent pages with the specified separator' do
            separator = Faker::Lorem.characters(5)

            @helper.breadcrumbs(@page, separator: separator).must_equal breadcrumb_links.join separator
          end

          describe 'nil' do
            it 'does not use a separator' do
              @helper.breadcrumbs(@page, separator: nil).must_equal breadcrumb_links.join
            end
          end
        end

        describe 'not specified' do
          it 'uses " > " as the separator' do
            @helper.breadcrumbs(@page).must_equal breadcrumb_links.join ' &gt; '
          end
        end
      end

      describe 'wrapper' do
        describe 'specified' do
          it 'wraps breadcrumbs in the specified element type' do
            wrapper = Faker::Lorem.word.to_sym
            wrapped_links = breadcrumb_links.collect {|link| content_tag(wrapper) { link } }
            @helper.breadcrumbs(@page, wrapper: wrapper, separator: nil).must_equal wrapped_links.join
          end
        end

        describe 'not specified' do
          it 'does not wrap breadcrumbs in tags' do
            @helper.breadcrumbs(@page, separator: nil).must_equal breadcrumb_links.join
          end
        end
      end
    end
  end

  private

  def breadcrumb_links
    [@grandparent, @parent, @page].collect do |level|
      link_to level.data.title, "/#{level.path}"
    end
  end

  def page
    path = Faker::Internet.url
    title = Faker::Lorem.sentence
    data = OpenStruct.new title: title
    OpenStruct.new data: data, path: path
  end
end
