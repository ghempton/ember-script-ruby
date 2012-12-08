require 'spec_helper'

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

  describe EmberScript::EmberScriptTemplate do

    subject { EmberScript::EmberScriptTemplate.new{ source } }

    it 'should render' do
      result = subject.render
      result.should =~ /Ember\.Object\.extend/
      result.should =~ /property/
    end

  end

end