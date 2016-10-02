require 'thor'

module Thorp
  class Command < ::Thor
    class << self
      def inherited(base) #:nodoc:
        base.send :extend,  ClassMethods
      end
    end

    module ClassMethods
      def namespace(name=nil)
        case name
        when nil
          parts = self.to_s.split("::")
          constant = parts.last
          constant =  ::Thor::Util.snake_case(constant).squeeze(":")
          @namspace ||= constant
        else
          super
        end
      end
    end
  end
end
