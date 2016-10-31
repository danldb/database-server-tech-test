require 'data_store'

describe DataStore do
  subject(:data_store){ DataStore.instance }

  after do
    clean_data_store
  end

  it 'returns nil if no data is found' do
    key = :some_key
    expect(data_store.get(key)).to be_nil
  end

  context "with a stored key" do
    let(:key) { :some_key }
    let(:value) { :some_value }

    before do
      data_store.set(key, value)
    end

    it "returns the value" do
      expect(data_store.get(key)).to eq value
    end

    it 'raises error if key already exists' do
      expect{ data_store.set(key, value) }.to raise_error(DataStore::KeyExistsError)
    end
  end

  def clean_data_store
    data_store.instance_variable_set(:@data, {})
  end
end
