# TODO: Write a Entity::attr_collection method that returns an empty array if not set

module Materialize
  class Entity
    include Utils

    attr_reader :source

    class << self

      def wrap(entities_data)
        entities_data.map { |entity_data| new(entity_data) }
      end

      alias :build :new

    end

    def initialize(attributes)
      @source = attributes

      raise "Attributes must be a hash" unless attributes.is_a?(Hash)

      attributes.each_pair do |key, value|
        value = attempt_entity_conversion(key, value) if collection?(value)
        instance_variable_set("@#{key}", value)
        (class << self; self; end).class_eval do
          attr_reader key.to_sym
        end
      end
    end

    def empty?
      source.empty?
    end

    private

    def attempt_entity_conversion(key, value)
      if class_exists?(covert_to_entity_class_name(key))
        klass = Module.const_get(covert_to_entity_class_name(key))
        if value.is_a?(Array)
          klass.wrap(value)
        else
          klass.new(value)
        end
      else
        value
      end
    end

    def collection?(value)
      value.is_a? Enumerable
    end

    def covert_to_entity_class_name(key)
      "Entities::#{base_name_for(key)}"
    end

    def base_name_for(key)
      key.to_s.singularize.split('_').collect(&:capitalize).join
    end

  end
end
