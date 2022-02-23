module Materialize
  module Concurrent

    def concurrent(*lambdas)
      threads = []
      lambdas.each do |l|
        threads << Thread.new do
          l.()
        end
      end
      threads.each(&:join)
    end

  end
end
