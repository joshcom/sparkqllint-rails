require 'sparkql'

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

  def parser
    @parser ||= Sparkql::Parser.new
  end

  def parse
    return if @parsed
    expressions = parser.parse(@filter.to_s)
    @parsed = true
  end

  def errors?
    self.parse 
    self.parser.errors?
  end

  def errors
    self.parse
    self.parser.errors
  end
end
