require 'json'

EVENT_PIPE = "events"
unless File.exist?(EVENT_PIPE)
  `mkfifo #{EVENT_PIPE}`
end

publisher = File.open(EVENT_PIPE, "w+")
publisher.sync = true

AfterConfiguration do |config|
  publisher.puts({event: "started", data: {}}.to_json)

  config.on_event :before_test_step do |event|
    publisher.puts(
      {
        event: "before_test_step",
        data: {}
      }.to_json
    )
  end

  config.on_event :after_test_step do |event|
    publisher.puts(
      {
        event: "after_test_step",
        data: { result: event.result.to_s }
      }.to_json
    )
  end
end

at_exit {
  publisher.puts({event: "done", data: {}}.to_json)
  publisher.close
}
