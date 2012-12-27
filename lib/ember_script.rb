# encoding: utf-8

require 'tilt'
require 'open3'

require 'ember_script/version'

module EmberScript

  class << self
    def engine
    end

    def engine=(engine)
    end

    def version
      `ember-script -v`
    end

    # Compile a EmberScript file to JavaScript
    # or generate the source maps.
    #
    # @param [String,#read] the source string or IO
    # @param [Hash] options the compiler options
    # @option options [Boolean] bare compile the JavaScript without the top-level function safety wrapper
    # @option options [String] format the output format, either `:map` or `:js`
    #
    def compile(script, options = {})
      script = script.read if script.respond_to?(:read)

      if options.key?(:bare)
      elsif options.key?(:no_wrap)
        options[:bare] = options[:no_wrap]
      else
        options[:bare] = false
      end
      bare = options[:bare] ? "--bare" : ""

      Open3.capture3("ember-script --js #{bare}", :stdin_data=>script)[0]
    end
  end

  class EmberScriptTemplate < ::Tilt::Template
    self.default_mime_type = 'application/javascript'

    @@default_bare = false

    def self.default_bare
      @@default_bare
    end

    def self.default_bare=(value)
      @@default_bare = value
    end

    def self.engine_initialized?
      true
    end

    def evaluate(scope, locals, &block)
      @output ||= EmberScript.compile(data, options)
    end

    def allows_script?
      false
    end

    def prepare
      if !options.key?(:bare) and !options.key?(:no_wrap)
        options[:bare] = self.class.default_bare
      end
    end
  end

  ::Tilt.register EmberScriptTemplate, 'em'

end
