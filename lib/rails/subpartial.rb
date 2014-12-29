require "action_view"
require "active_model"

module Rails
  module Subpartial
    require_relative "subpartial/version"
    require_relative "subpartial/action_view/renderer/partial_renderer"
    require_relative "subpartial/active_model/conversion"
  end
end
