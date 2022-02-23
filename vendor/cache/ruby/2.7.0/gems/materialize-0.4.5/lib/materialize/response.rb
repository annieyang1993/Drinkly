module Materialize
  class Response

    attr_reader :message, :status, :options

    def initialize(options)
      @message = options['message']
      @status  = options['status'].to_sym
      @options = options
    end

    def ok?
      status == :ok
    end

    # This is used to look up ids -> e.g. patient_id, phase_id, etc.
    def method_missing(message)
      options.send(:[], message.to_s)
    end

  end
end
