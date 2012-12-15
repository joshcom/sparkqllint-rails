class FilterValidator

  def self.sanitize_incoming_filter(filter)
    filter.nil? ? nil : filter.strip
  end

  def initialize(filter)
    @filter = FilterValidator.sanitize_incoming_filter(filter)
  end

  def blank?
    @filter.blank?
  end

  def filter_text
    @filter
  end
end
