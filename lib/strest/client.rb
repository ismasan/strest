require 'uri'

module Strest
  module Client
    
    def self.included(base)
      base.class_inheritable_hash :mapper_classes
      base.mapper_classes = {:default => Strest::ResponseMapper}
      
      base.extend ClassMethods
      base.send :include, InstanceMethods
    end
    
    module ClassMethods
      
      def map_with(klass)
        self.default_mapper = klass
      end
      
      def default_mapper=(klass)
        mapper_classes[:default] = klass
      end
      
      def default_mapper
        mapper_classes[:default]
      end
      
      # Create class-level GET methods
      #
      def get(method_name, path, options={})
        
        self.class.class_eval <<-EOV
          def #{method_name.to_s}(*params)
            opts = params.last.is_a?(Hash) ? params.pop : {}
            connection.get('#{path}')
          end
        EOV
      end
      
      def site=(s)
        @@site = create_site_uri_from(s)
      end
      
      def site
        @@site || nil
      end
      
      # HTP connection
      #
      def connection(method_name=nil)
        @@connections ||= {}
        @@connections[method_name] ||= Strest::Connection.new(site)
        @@connections[method_name]
      end
      
      # Accepts a URI and creates the site URI from that.
      def create_site_uri_from(site)
        site.is_a?(URI) ? site.dup : URI.parse(site)
      end
      
    end
    
    module InstanceMethods
      
      def connection
        self.class.connection
      end
      
    end
    
  end
end