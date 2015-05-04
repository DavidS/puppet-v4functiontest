require 'spec_helper'
require 'puppet/pops'
require 'puppet/loaders'

describe 'the max function' do
  before(:all) do
    loaders = Puppet::Pops::Loaders.new(Puppet::Node::Environment.create(:testing, []))
    Puppet.push_context({ :loaders => loaders }, 'test-examples')
  end

  after(:all) do
    Puppet::Pops::Loaders.clear
    Puppet::pop_context()
  end

  def max(*args)
    Puppet.lookup(:loaders).puppet_system_loader.load(:function, 'max').call({}, *args)
  end

  let(:type_parser) { Puppet::Pops::Types::TypeParser.new }

  context 'when passing two integers' do
    it 'should return the highest value' do
      expect(max(1, 2)).to eql(2)
    end
  end
end
