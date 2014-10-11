module ActsAsSego

  module Intercepter

    def self.included(base)
      base.send(:capture, base.class, :define_method) do |method, result, args|
        puts "Yay Dynamically defined methods!"
      end
    end

    # simplied from:
    # http://code.google.com/p/rcapture/
    #
    # TODO: figure out how to make this work with
    # methods defined after the inclusion of this module
    def capture(klass, method, &callback)
      previous_method = klass.method(method)

      klass.class_eval do
        define_method "#{method}" do |*args, &block|
          result = previous_method.call(*args, &block)
          callback.call(method, result, args)
          result
        end
      end
    end
  end
end

Object.send(:include, ActsAsSego::Intercepter)