module Materialize
  class BaseBuilder
    extend Concurrent
    class << self

      def build(data, repo, options)
        data = data.merge({ __repo__: repo, __options__: options })
        entity_class.new(data)
      end

      def build_all(data, repo, options)
        datas = data.map { |d| d.merge({ __repo__: repo, __options__: options }) }
        entity_class.wrap(datas)
      end

      def entity_class
        "Entities::#{entity_base_class_name}".split('::').reduce(Module, :const_get)
      end

      private

      def entity_base_class_name
        "#{self.name[0..-8]}".split('::').last
      end

    end
  end
end
