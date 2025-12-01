class Item < ApplicationRecord
  after_create :increment_items_created_metric

  private

  def increment_items_created_metric
    Metrics.items_created.increment
  end
end