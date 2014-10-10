module ActsAsSego

  module Intercepter

    def self.included(base)
      # base.send(:capture, self, :define_method) do |method, result, args|
      #   puts "Yay Dynamically defined methods!"
      # end
    end

    # simplied from:
    # http://code.google.com/p/rcapture/
    def capture(klass, method, &callback)
      previous_method = klass.instance_method(method)

      klass.class_eval do
        define_method "#{method}" do |*args, &block|
          result = previous_method.bind(self).call(*args, &block)
          callback.call(method, result, args)
          result
        end
      end
    end
  end

end