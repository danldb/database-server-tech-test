class Key
  @key = []

  class << self 
    def create_or_update(value)
      @key << new(value)
    end

    def get
      @key.last
    end
  end

  def initialize(value)
    @value = value
  end

  def to_s
    @value.to_s
  end

  private_instance_methods :new

end
