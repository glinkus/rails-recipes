class MetricsController < ApplicationController
  def index
    render plain: PROMETHEUS.metrics.map(&:to_s).join("\n")
  end
end