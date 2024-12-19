# frozen_string_literal: true

module Floe
  class Workflow
    class Retrier
      attr_reader :error_equals, :interval_seconds, :max_attempts, :backoff_rate

      def initialize(payload)
        @payload = payload

        @error_equals     = payload["ErrorEquals"]
        @interval_seconds = payload["IntervalSeconds"] || 1.0
        @max_attempts     = payload["MaxAttempts"] || 3
        @backoff_rate     = payload["BackoffRate"] || 2.0
      end

      def sleep_duration(attempt)
        interval_seconds * (backoff_rate * attempt)
      end
    end
  end
end
