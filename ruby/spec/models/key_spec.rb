require 'spec_helper'
require 'models/key'

RSpec.describe Key do
  it "creates a key" do
    value = "some string"
    key = Key.create_or_update(value)
    expect(key.to_s).to eq(value)
  end
end
