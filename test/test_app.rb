require 'helper'
require 'rudge/app'
include Rudge

describe App do
  let(:stub_valid_configuration) { mock('valid').tap {|m|
      m.stubs(:valid?).returns(true)
      m.stubs(:files).returns([])
      m.stubs(:invalid?).returns(false)
    }
  }
  #Fixme override name
  let(:stub_valid_options) { stub_valid_configuration }

  describe '#new' do

    describe 'valid input' do
      it 'wont raise with valid configuration' do
        Rudge::App.new(stub_valid_options, stub_valid_configuration)
      end
    end

    describe 'invalid input' do
      let(:stub_invalid_configuration) { mock('invalid').tap {|m|
          m.stubs(:valid?).returns(false)
          m.stubs(:invalid?).returns(true)
        }
      }
      let(:stub_invalid_options) { stub_invalid_configuration }

      it 'raises when all arguments are nil' do
        proc {
          App.new(nil, nil)
        }.must_raise RudgeArgumentError
      end

      it 'raises when configuration arguments are nil' do
        proc {
          App.new(stub_valid_options, nil)
        }.must_raise RudgeArgumentError
      end

      it 'raises when configuration arguments are invalid' do
        proc {
          App.new(stub_valid_options, stub_invalid_options)
        }.must_raise RudgeArgumentError
      end

      it 'raises when options arguments are nil' do
        proc {
          App.new(nil, stub_valid_configuration)
        }.must_raise RudgeArgumentError
      end

      it 'raises when options arguments are invalid' do
        proc {
          App.new(stub_invalid_options, stub_valid_configuration)
        }.must_raise RudgeArgumentError
      end
    end

  end

  describe '#run' do
    it 'print violation recipt' do
      skip
      judge = mock("judge")
      stub_valid_options.stubs(:files).returns([])
      judge.expects(:apply_rules_on).once.with([])
      report_handler = mock("report_handler")
      report_handler.expects(:run_all_reports).once
      Rudge::App.new(stub_valid_options,
                    stub_valid_configuration,
                    :stub_rules,
                    :stub_offence_handler,
                    judge,
                    report_handler).run
    end


  end
end

