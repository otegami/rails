# frozen_string_literal: true

module Rails
  module Generators
    module TestingFramework # :nodoc:
      TESTING_FRAMEWORK = %w( minitest test-unit )

      def initialize(*)
        super
        # TODO: Search for the situation about JRuby
        convert_testing_framework_option_for_jruby
      end

      def gem_for_testing_framework(testing_framework = options[:testing_framework])
        case testing_framework
        when "minitest"       then ["minitest", [">= 5.15.0"]]
        when "test-unit"      then ["test-unit", ["~> 2.4"]]
        else [testing_framework, nil]
        end
      end

      def convert_testing_framework_option_for_jruby
        if defined?(JRUBY_VERSION)
          opt = options.dup
          # TODO
          self.options = opt.freeze
        end
      end
    end
  end
end
