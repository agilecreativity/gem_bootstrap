require_relative '../../test_helper'
describe <%= MiscUtils.camel_case(name) %> do
  context '#dummy_test' do
    it 'passes the simple test' do
      'test string'.wont_be_nil
    end
  end
end
