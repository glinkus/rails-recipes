require 'prometheus_exporter/server'
require 'prometheus_exporter/client'
require 'prometheus_exporter/instrumentation'
require 'prometheus_exporter/metric'

# Start a local exporter server inside the Rails process
server = PrometheusExporter::Server::WebServer.new(
  bind: 'localhost',
  port: 12345
)
server.start

# Use a LocalClient so metrics are NOT sent over TCP, but directly
PrometheusExporter::Client.default = PrometheusExporter::LocalClient.new(
  collector: server.collector
)

# Add basic Ruby metrics (RSS, object counts, etc)
PrometheusExporter::Instrumentation::Process.start(
  type: "rails_app"
)

# Custom metrics
ITEMS_COUNTER = PrometheusExporter::Metric::Counter.new(
  "items_index_total",
  "Items index endpoint hits"
)

ITEMS_HISTOGRAM = PrometheusExporter::Metric::Histogram.new(
  "items_index_duration_seconds",
  "Time spent in items#index"
)

# Register them with the collector (this is what you were missing before)
server.collector.register_metric(ITEMS_COUNTER)
server.collector.register_metric(ITEMS_HISTOGRAM)
