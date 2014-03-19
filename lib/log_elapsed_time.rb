def log_elapsed_time(message_prefix = nil, &block)
  start_time = Time.now
  return_value = yield
  elapsed_time = ((Time.now - start_time) * 1000).to_i
  Rails.logger.info [message_prefix, "#{elapsed_time}ms"].compact.join(' ')
  return return_value
end
