require 'prometheus/client'

PROMETHEUS = Prometheus::Client.registry

module Metrics
  def self.items_created
    @items_created ||= PROMETHEUS.counter(:items_created_total, docstring: 'Total number of items created')
  end
end