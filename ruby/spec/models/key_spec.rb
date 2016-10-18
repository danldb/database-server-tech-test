require 'spec_helper'
require 'models/key'

RSpec.describe Key do
  subject(:key){ described_class.get }
  it "creates a key" do
    value = "some string"
    Key.create_or_update(value)
    expect(key.to_s).to eq(value)
  end
end
