require 'ocd_lookup/version'
require 'csv'

module OcdLookup
  class DivisionId
    attr_reader :mapping

    def self.parse(csv_data)
      rows = CSV.parse(csv_data, headers: true, header_converters: :symbol)
      new(rows.map(&:to_hash))
    end

    def initialize(rows)
      @mapping = Hash[rows.map { |r| [r[:name], r[:id]] }]
    end

    # Figure out what order we should search the types in.
    def priority
      @priority ||= mapping.values.map do |t|
        t.split('/').drop(1).map { |p| p.split(':').first }.map(&:to_sym)
      end.uniq
    end

    def find(opts)
      ids = opts.map { |type, val| id = mapping[val]; id if id && id.split('/').last.start_with?(type.to_s) }
      return if ids.any?(&:nil?)
      ids.reduce { |prev, id| prev && prev.start_with?(id) ? prev : id }
    end
  end
end
