# frozen_string_literal: true

require_relative "floe/version"

require_relative "floe/null_logger"
require_relative "floe/logging"

require_relative "floe/workflow"
require_relative "floe/workflow/catcher"
require_relative "floe/workflow/choice_rule"
require_relative "floe/workflow/choice_rule/boolean"
require_relative "floe/workflow/choice_rule/data"
require_relative "floe/workflow/context"
require_relative "floe/workflow/path"
require_relative "floe/workflow/payload_template"
require_relative "floe/workflow/reference_path"
require_relative "floe/workflow/retrier"
require_relative "floe/workflow/runner"
require_relative "floe/workflow/runner/docker"
require_relative "floe/workflow/runner/kubernetes"
require_relative "floe/workflow/runner/podman"
require_relative "floe/workflow/state"
require_relative "floe/workflow/states/choice"
require_relative "floe/workflow/states/fail"
require_relative "floe/workflow/states/map"
require_relative "floe/workflow/states/parallel"
require_relative "floe/workflow/states/pass"
require_relative "floe/workflow/states/succeed"
require_relative "floe/workflow/states/task"
require_relative "floe/workflow/states/wait"

require "jsonpath"

module Floe
  class Error < StandardError; end
  class InvalidWorkflowError < Error; end

  def self.logger
    @logger ||= NullLogger.new
  end

  def self.logger=(logger)
    @logger = logger
  end
end
