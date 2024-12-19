# frozen_string_literal: true

module Floe
  class Workflow
    class ChoiceRule
      class Data < Floe::Workflow::ChoiceRule
        def true?(context, input)
          lhs = variable_value(context, input)
          rhs = compare_value(context, input)

          validate!(lhs)

          case compare_key
          when "IsNull" then is_null?(lhs)
          when "IsPresent" then is_present?(lhs)
          when "IsNumeric" then is_numeric?(lhs)
          when "IsString" then is_string?(lhs)
          when "IsBoolean" then is_boolean?(lhs)
          when "IsTimestamp" then is_timestamp?(lhs)
          when "StringEquals", "StringEqualsPath",
               "NumericEquals", "NumericEqualsPath",
               "BooleanEquals", "BooleanEqualsPath",
               "TimestampEquals", "TimestampEqualsPath"
            lhs == rhs
          when "StringLessThan", "StringLessThanPath",
               "NumericLessThan", "NumericLessThanPath",
               "TimestampLessThan", "TimestampLessThanPath"
            lhs < rhs
          when "StringGreaterThan", "StringGreaterThanPath",
               "NumericGreaterThan", "NumericGreaterThanPath",
               "TimestampGreaterThan", "TimestampGreaterThanPath"
            lhs > rhs
          when "StringLessThanEquals", "StringLessThanEqualsPath",
               "NumericLessThanEquals", "NumericLessThanEqualsPath",
               "TimestampLessThanEquals", "TimestampLessThanEqualsPath"
            lhs <= rhs
          when "StringGreaterThanEquals", "StringGreaterThanEqualsPath",
               "NumericGreaterThanEquals", "NumericGreaterThanEqualsPath",
               "TimestampGreaterThanEquals", "TimestampGreaterThanEqualsPath"
            lhs >= rhs
          when "StringMatches"
            lhs.match?(Regexp.escape(rhs).gsub('\*', '.*?'))
          else
            raise Floe::InvalidWorkflowError, "Invalid choice [#{compare_key}]"
          end
        end

        private

        def validate!(value)
          raise "No such variable [#{variable}]" if value.nil? && !%w[IsNull IsPresent].include?(compare_key)
        end

        def is_null?(value)
          value.nil?
        end

        def is_present?(value)
          !value.nil?
        end

        def is_numeric?(value)
          value.kind_of?(Integer) || value.kind_of?(Float)
        end

        def is_string?(value)
          value.kind_of?(String)
        end

        def is_boolean?(value)
          [true, false].include?(value)
        end

        def is_timestamp?(value)
          require "date"

          DateTime.rfc3339(value)
          true
        rescue TypeError, Date::Error
          false
        end

        def compare_key
          @compare_key ||= payload.keys.detect { |key| key.match?(/^(IsNull|IsPresent|IsNumeric|IsString|IsBoolean|IsTimestamp|String|Numeric|Boolean|Timestamp)/) }
        end

        def compare_value(context, input)
          compare_key.end_with?("Path") ? Path.value(payload[compare_key], context, input) : payload[compare_key]
        end
      end
    end
  end
end
