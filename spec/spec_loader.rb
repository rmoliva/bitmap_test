# encoding: utf-8
# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start

# Load library
require File.join('.', 'lib', 'bitmap_editor.rb')

# Load support spec files
Dir[File.join(__dir__, 'support', '**', '*.rb')].each { |f| require f }
