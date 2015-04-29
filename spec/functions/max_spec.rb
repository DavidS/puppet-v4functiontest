require 'spec_helper'

describe 'max' do
  it { should run.with_params(1, 2).and_return(2) }
end
