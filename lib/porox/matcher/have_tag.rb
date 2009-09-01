module Porox
  module Matcher
    class HaveTag
      def initialize(desired_value)
        @desired_value = desired_value
      end

      def matches?(actual_value)
        @actual_value = actual_value
        document = Hpricot(actual_value)
        @tags = (document / @desired_value).to_a
        !@tags.empty?
      end
  
      def description
        "have tag"
      end
  
      def failure_message
        "#{@actual_value} did not have a tag matching #{@desired_value}"
      end
  
      def negative_failure_message
        "#{@actual_value} should not have a tag matching #{@desired_value}"
      end
    end
  end
end
