require 'aws-sdk-s3'
require 'logger'

# Constants and methods
module AmazonSsaSupport
  DEFAULT_HEARTBEAT_PREFIX   = 'extract/heartbeat/'.freeze
  DEFAULT_HEARTBEAT_INTERVAL = 120

  DEFAULT_REQUEST_QUEUE      = 'smartstate_extract_request'.freeze
  DEFAULT_REPLY_QUEUE        = 'smartstate_extract_reply'.freeze

  DEFAULT_REPLY_PREFIX       = 'extract/queue-reply/'.freeze
  DEFAULT_LOG_PREFIX         = 'extract/logs/'.freeze

  DEFAULT_LOG_LEVEL          = 'INFO'.freeze
  DEFAULT_BUCKET_PREFIX      = 'smartstate'.freeze

  DEFAULT_REQUEST_TIMEOUT    = 900 # 15 min
end
