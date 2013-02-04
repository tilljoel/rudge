require 'helper'
require 'rudge/command_line_handler'

describe Rudge::CommandLineHandler do
  describe 'API' do

    it "returns a Rudge::CommandLineOptions object" do
      options = Rudge::CommandLineHandler.new([]).options
      options.must_be_instance_of Rudge::CommandLineOptions
    end

    it "has correct default values" do
      options = Rudge::CommandLineHandler.new([]).options
      options.debug.must_equal false
      options.verbose.must_equal false
    end

    it "parses --debug correctly" do
      opts_array = [
        ["-d"],
        ["--debug"],
        ["foo", "-d", "bar"],
        ["foo", "--debug", "bar"]
      ]
      opts_array.each do |opts|
        options = Rudge::CommandLineHandler.new(opts).options
        options.debug.must_equal true, "debug not set, arguments #{opts}"
      end
    end

    it "parses --verbose correctly" do
      opts_array = [
        ["-v"],
        ["--verbose"],
        ["foo", "-v", "bar"],
        ["foo", "--verbose", "bar"]
      ]
      opts_array.each do |opts|
        options = Rudge::CommandLineHandler.new(opts).options
        options.verbose.must_equal true, "verbose not set, arguments #{opts}"
      end
    end

    it "handles invalid option correctly" do
      out, err = capture_io {
        proc {
          opts = ["-x"]
          options = Rudge::CommandLineHandler.new(opts).options
        }.must_raise SystemExit
      }
      out.must_include "invalid option: -x"
    end

    it "find files that" do
      opts = ["file.rb", "-d", "file2.rb", "../file4.rb"]
      options = Rudge::CommandLineHandler.new(opts).options
      options.files.must_equal ["file.rb", "file2.rb", "../file4.rb"]
    end
  end
end

describe Rudge::CommandLineOptions do
  describe 'validations' do
    describe 'non valid' do
      it "its not valid without verbose" do
        opts = Rudge::CommandLineOptions.new
        opts.debug = true
        opts.files = [__FILE__]
        opts.valid?.must_equal false
        opts.errors.messages.must_include :verbose
        opts.errors.messages.count.must_equal 1, opts.errors.messages
      end

      it "its not valid without debug" do
        opts = Rudge::CommandLineOptions.new
        opts.verbose = true
        opts.files = [__FILE__]
        opts.valid?.must_equal false
        opts.errors.messages.must_include :debug
        opts.errors.messages.count.must_equal 1, opts.errors.messages
      end

      it "it is not valid without files" do
        opts = Rudge::CommandLineOptions.new
        opts.verbose = true
        opts.debug = true
        opts.valid?.must_equal false
        opts.errors.messages.must_include :files
        opts.errors.messages.count.must_equal 1, opts.errors.messages
      end

      it "its not valid if any files in unreadable" do
        opts = Rudge::CommandLineOptions.new
        opts.verbose = true
        opts.debug = true
        opts.files = ["not_readable.rb"]
        opts.valid?.must_equal false
        opts.errors.messages.must_include :files
      end
    end

    describe 'valid' do
      it "valid with good input" do
        opts = Rudge::CommandLineOptions.new
        opts.verbose = true
        opts.debug = true
        opts.files = [__FILE__]
        opts.valid?.must_equal true
      end
    end
  end
end

