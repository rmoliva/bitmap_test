# encoding: utf-8
# frozen_string_literal: true

# Load Transformations
Dir[File.join(__dir__, 'bitmap_editor', 'transformations', '*.rb')].each { |f| require f }

# Load Commands
Dir[File.join(__dir__, 'bitmap_editor', 'commands', '*.rb')].each { |f| require f }

# Load BitmatEditor library
Dir[File.join(__dir__, 'bitmap_editor', '*.rb')].each { |f| require f }
