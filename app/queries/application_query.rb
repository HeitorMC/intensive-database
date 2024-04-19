# frozen_string_literal: true

class ApplicationQuery
  attr_reader :options

  def initialize(**options)
    @options = options
  end

  def call
    Rails.logger.warn "#{__method__} is not implemented in #{self.class.name}"

    nil
  end

  private

  def execute_query(query, bindings = [], to_array: true)
    response = ApplicationRecord.connection.exec_query(query, "#{self.class.name} SQL", bindings)
    return response.to_a if to_array

    response
  end

  def load_query(filename)
    Rails.root.join('app/queries/', filename).read
  end
end
