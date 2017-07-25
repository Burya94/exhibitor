require 'spec_helper'
describe 'exhibitor' do
  context 'with default values for all parameters' do
    it { should contain_class('exhibitor') }
  end
end
