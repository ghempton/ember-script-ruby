require 'spec_helper'

RSpec::Matchers.define :be_wrapped_in_closure do
  match do |result|
    result =~ /void function ()/
  end
end

describe EmberScript do

  source = <<-eos
class App
  +computed
  myProp: -> 'hello world'
eos

  it 'should compile' do
    result = EmberScript.compile(source)
    result.should =~ /Ember\.Object\.extend/
    result.should =~ /property/
  end

  it 'should output version' do
    EmberScript::Source.version.should_not be_empty
  end

  describe EmberScript::EmberScriptTemplate do

    # Ensure default_bare has its default value.
    default_bare = EmberScript::EmberScriptTemplate.default_bare
    before { EmberScript::EmberScriptTemplate.default_bare = default_bare }

    subject { EmberScript::EmberScriptTemplate.new{ source } }

    def render_and_check_output
      result = subject.render
      result.should =~ /Ember\.Object\.extend/
      result.should =~ /property/
      result
    end

    it 'should render' do
      result = render_and_check_output
      result.should be_wrapped_in_closure
    end

    context 'without closure wrapping' do
      it 'should render without closure if default_bare is true' do
        EmberScript::EmberScriptTemplate.default_bare = true
        result = render_and_check_output
        result.should_not be_wrapped_in_closure
      end

      it 'should render without closure if options[:bare] is true' do
        subject = EmberScript::EmberScriptTemplate.new(bare: true) { source }
        result = subject.render
        result.should_not be_wrapped_in_closure
      end
    end
  end
end
