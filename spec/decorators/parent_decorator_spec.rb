require 'spec_helper'

describe ParentDecorator do
  let(:parent) { Parent.new.extend ParentDecorator }
  subject { parent }
  it { should be_a Parent }
end
