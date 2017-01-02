require 'spec_helper'

describe BookDecorator do
  let(:book) { Book.new.extend BookDecorator }
  subject { book }
  it { should be_a Book }
end
