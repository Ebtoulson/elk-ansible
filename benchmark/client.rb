require 'syslog_compat'
require 'json'

LOGSTASH_HOST = ENV['LOGSTASH_HOST']
LOGSTASH_PORT = 5000
SLOW_DOWN = ENV['SLOW_DOWN']
DELAY_RANGE = (0.1 .. 1).step(0.1).to_a

raise StandardError.new("Missing LOGSTASH_HOST") unless LOGSTASH_HOST

$count = 0
$logger = SyslogRuby::Logger.new('ruby', :LOCAL3, uri: "tcp://#{LOGSTASH_HOST}:#{LOGSTASH_PORT}")

interrupted = false
trap("INT") { interrupted = true }

until interrupted do
  $count += 1

  # set SLOW_DOWN to simulate slow traffic
  sleep(DELAY_RANGE.sample) if SLOW_DOWN

  msg =  {count: $count}.to_json

  $logger.info msg
end

puts "count: #{$count}\ntime: #{Time.now}"