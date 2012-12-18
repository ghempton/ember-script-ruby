# encoding: utf-8

require 'tilt'
require 'open3'

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

      Open3.capture3("ember-script --js", :stdin_data=>script)[0]
    end
  end

  class EmberScriptTemplate < ::Tilt::Template
    self.default_mime_type = 'application/javascript'

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
    end
  end

  ::Tilt.register EmberScriptTemplate, 'em'

end