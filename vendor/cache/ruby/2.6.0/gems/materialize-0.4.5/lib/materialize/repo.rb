module Materialize
  class Repo
    include Utils

    attr_reader :token

    def initialize(token = nil)
      @token = token
    end

    def method_missing(query, *args, &block)
      data_source_class = args[0]
      options           = args[1] || {}
      args_to_pass      = options[:args]

      data, builder_class, entity_class = process(data_source_class, query, args_to_pass)

      yield(data) if block_given?

      options.delete(:args)

      # TODO: add a temporary bypass switch that skips builders
      # TODO: Switch to something like data['m_message'] to avoid collisions

      if options[:skip_builders]
        if data.is_a?(Hash) and !data['message'].nil?
          Response.new data
        elsif data.is_a?(Array)
          entity_class.wrap(data)
        else
          entity_class.new(data)
        end
      else
        if data.is_a?(Hash) and !data['message'].nil?
          Response.new data
        elsif data.is_a?(Array)
          builder_class.build_all(data, self, options)
        else
          builder_class.build(data, self, options)
        end
      end

    end

    private

    def process(data_source_class, query, args_to_pass)
      data          = get_data(data_source_class, query, args_to_pass)
      builder_class = builder_class_for builder_class_name_for base_class_name_for data_source_class
      entity_class  = entity_class_for base_class_name_for data_source_class

      return data, builder_class, entity_class
    end

    def builder_class_for(builder_class_name)
      if class_exists?(builder_class_name)
        Module.const_get(builder_class_name)
      else
        Object.const_set(builder_class_name, Class.new(Materialize::BaseBuilder))
      end
    end

    def builder_class_name_for(base_class_name)
      "#{base_class_name}Builder"
    end

    def entity_class_for(base_class_name)
      Module.const_get("Entities::#{base_class_name}")
    end

    def base_class_name_for(data_source_class)
      data_source_class.name.split('::').last
    end

    def get_data(data_source_class, query, args_to_pass)
      if token.nil?

        if args_to_pass.nil?
          data_source_class.send(query)
        elsif args_to_pass.is_a?(Array)
          data_source_class.send(query, *args_to_pass)
        else
          data_source_class.send(query, args_to_pass)
        end

      else

        if args_to_pass.nil?
          data_source_class.send(query, token)
        elsif args_to_pass.is_a?(Array)
          data_source_class.send(query, token, *args_to_pass)
        else
          data_source_class.send(query, token, args_to_pass)
        end

      end
    end

  end
end
