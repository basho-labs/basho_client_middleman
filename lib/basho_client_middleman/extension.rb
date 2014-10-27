(require 'pry') rescue nil

module BashoClientMiddleman
  class Extension < Middleman::Extension
    def initialize(app, options={}, &block)
      super

      self.app = app

      app.include InstanceMethods

      setup_layouts

      app.set :markdown_engine, :redcarpet

      app.set :markdown, fenced_code_blocks: true, smartypants: true
      app.set :haml, { ugly: true }

      app.configure :build do
        activate :relative_assets
        set :relative_links, true
      end
    end

    module InstanceMethods
      def add_basho_resources(sprockets)
        sprockets.append_path d('stylesheets')
        sprockets.append_path d('javascripts')
      end
      private

      def d(ext)
        File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'source', ext))
      end

    end

    private

    def d(ext)
      File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'source', ext))
    end

    def setup_layouts
      target = app.config[:layout_target_dir]
      FileUtils.ln_s(d('layouts/layout.haml'), target, force: true)
    end
  end
end

::Middleman::Extensions.register :basho_client, BashoClientMiddleman::Extension
