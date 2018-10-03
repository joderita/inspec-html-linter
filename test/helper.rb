require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

# Data formats commonly used in testing
require 'json'
require 'ostruct'

# Locate InSpec source tree for helpers
require 'inspec/globals'

require 'train'
require 'byebug'

class Module
  include Minitest::Spec::DSL
end

module Inspec
  class FuncTestRunResult
    attr_reader :train_result
    attr_reader :payload

    extend Forwardable
    def_delegator :train_result, :stdout
    def_delegator :train_result, :stderr
    def_delegator :train_result, :exit_status

    def initialize(train_result)
      @train_result = train_result
      @payload = OpenStruct.new
    end
  end
end

module TestHelper
  let(:inspec_src) { Inspec.src_root }
  let(:inspec_bin_path) { File.join(inspec_src, 'bin', 'inspec') }
  let(:resource_pack_root) { File.expand_path('.')}
  let(:fixtures_path) { File.join(resource_pack_root, 'test', 'fixtures') }

  TRAIN_CONNECTION = Train.create('local', command_runner: :generic).connection

  def run_inspec_process(command_line)
    Inspec::FuncTestRunResult.new(TRAIN_CONNECTION.run_command("#{inspec_bin_path} #{command_line}"))
  end

  def run_inspec_with_json(command_line)
    run_result = run_inspec_process(command_line + ' --reporter json')
    if run_result.exit_status != 1
      run_result.payload.json = JSON.parse(run_result.stdout)
    else
      run_result.payload.json = {}
    end
    run_result
  end
end