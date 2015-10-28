require_relative './spec_helper'
require 'ostruct'
require 'middleman-breadcrumbs/breadcrumbs_helper'

describe BreadcrumbsHelper do
  before do
    @helper = Object.new
    @helper_class = @helper.singleton_class
  end

  describe '.included' do
    describe 'link_to is defined' do
      it 'does not include Padrino::Helpers' do
        methods = @helper_class.instance_methods
        @helper_class.stub :instance_methods, methods + [:link_to] do
          @helper_class.send :include, BreadcrumbsHelper
          @helper_class.wont_include Padrino::Helpers
        end
      end
    end

    describe 'link_to is not defined' do
      it 'includes Padrino::Helpers' do
        @helper_class.send :include, BreadcrumbsHelper
        @helper_class.must_include Padrino::Helpers
      end
    end
  end

  describe '#breadcrumbs' do
    before do
      @helper.singleton_class.send :include, BreadcrumbsHelper
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
