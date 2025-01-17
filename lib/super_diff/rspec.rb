require "super_diff"

module SuperDiff
  module RSpec
    autoload :AugmentedMatcher, "super_diff/rspec/augmented_matcher"
    autoload :Configuration, "super_diff/rspec/configuration"
    autoload :Differ, "super_diff/rspec/differ"
    autoload :Differs, "super_diff/rspec/differs"
    autoload :MatcherTextBuilders, "super_diff/rspec/matcher_text_builders"
    autoload :MatcherTextTemplate, "super_diff/rspec/matcher_text_template"
    autoload :ObjectInspection, "super_diff/rspec/object_inspection"
    autoload :OperationalSequencers, "super_diff/rspec/operational_sequencers"

    class << self
      attr_accessor :extra_differ_classes
      attr_accessor :extra_operational_sequencer_classes
      attr_accessor :extra_diff_formatter_classes
    end

    def self.configure
      yield configuration
    end

    def self.configuration
      @_configuration ||= Configuration.new
    end

    def self.partial_hash?(value)
      partial_placeholder?(value) &&
        value.respond_to?(:expecteds) &&
        value.expecteds.one? &&
        value.expecteds.first.is_a?(::Hash)
    end

    def self.partial_array?(value)
      partial_placeholder?(value) &&
        value.respond_to?(:expecteds) &&
        !(value.expecteds.one? && value.expecteds.first.is_a?(::Hash))
    end

    def self.partial_object?(value)
      partial_placeholder?(value) &&
        value.base_matcher.is_a?(::RSpec::Matchers::BuiltIn::HaveAttributes)
    end

    def self.collection_containing_exactly?(value)
      partial_placeholder?(value) &&
        value.base_matcher.is_a?(::RSpec::Matchers::BuiltIn::ContainExactly)
    end

    def self.partial_placeholder?(value)
      value.is_a?(::RSpec::Matchers::AliasedMatcher)
    end
  end
end

require_relative "rspec/monkey_patches"

SuperDiff::ObjectInspection.map.prepend(
  SuperDiff::RSpec::ObjectInspection::MapExtension,
)

SuperDiff::Csi.color_enabled = RSpec.configuration.color_enabled?
