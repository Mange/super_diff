require "patience_diff"
require "diff-lcs"

require_relative "super_diff/csi"
require_relative "super_diff/errors"
require_relative "super_diff/helpers"
require_relative "super_diff/inspection/abstract_node"
require_relative "super_diff/inspection/opening_node"
require_relative "super_diff/inspection/middle_node"
require_relative "super_diff/inspection/closing_node"
require_relative "super_diff/inspection/tree"
require_relative "super_diff/inspection/build_tree"

require_relative "super_diff/equality_matchers/base"
require_relative "super_diff/equality_matchers/array"
require_relative "super_diff/equality_matchers/hash"
require_relative "super_diff/equality_matchers/multi_line_string"
require_relative "super_diff/equality_matchers/single_line_string"
require_relative "super_diff/equality_matchers/object"
require_relative "super_diff/equality_matchers"
require_relative "super_diff/equality_matcher"

require_relative "super_diff/operations/unary_operation"
require_relative "super_diff/operations/binary_operation"

require_relative "super_diff/operation_sequences/base"
require_relative "super_diff/operation_sequences/array"
require_relative "super_diff/operation_sequences/hash"
require_relative "super_diff/operation_sequences/object"

require_relative "super_diff/operational_sequencers/base"
require_relative "super_diff/operational_sequencers/array"
require_relative "super_diff/operational_sequencers/hash"
require_relative "super_diff/operational_sequencers/multi_line_string"
require_relative "super_diff/operational_sequencers/object"
require_relative "super_diff/operational_sequencers"
require_relative "super_diff/operational_sequencer"

require_relative "super_diff/diff_formatters/collection"
require_relative "super_diff/diff_formatters/base"
require_relative "super_diff/diff_formatters/array"
require_relative "super_diff/diff_formatters/hash"
require_relative "super_diff/diff_formatters/multi_line_string"
require_relative "super_diff/diff_formatters/object"
require_relative "super_diff/diff_formatters"
require_relative "super_diff/diff_formatter"

require_relative "super_diff/differs/base"
require_relative "super_diff/differs/array"
require_relative "super_diff/differs/empty"
require_relative "super_diff/differs/hash"
require_relative "super_diff/differs/multi_line_string"
require_relative "super_diff/differs/object"
require_relative "super_diff/differs"
require_relative "super_diff/differ"

module SuperDiff
  class << self
    attr_accessor :values_equal
  end

  self.values_equal = -> (expected, actual) do
    expected == actual
  end
end
