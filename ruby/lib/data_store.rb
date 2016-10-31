class DataStore

  attr_reader :data
  private :data
  private_class_method :new

  def self.instance(data = nil)
    @instance ||= new(data)
  end

  def initialize(data = nil)
    @data = data || {}
  end

  def set(key, value)
    raise KeyExistsError.new(pair: {key => value}) if @data.keys.include?(key)
    @data[key] = value
  end

  def get(key)
    @data[key]
  end

  class KeyExistsError < StandardError

    DEFAULT_MESSAGE = ->(pair){ "#{pair.inspect} already exists"}

    def initialize(pair:)
      super(DEFAULT_MESSAGE.call(pair))
    end
  end
end
