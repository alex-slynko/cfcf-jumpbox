# frozen_string_literal: true

require 'support/template_helpers'

RSpec.configure do |config|
  config.include TemplateHelpers
  config.disable_monkey_patching!
end

