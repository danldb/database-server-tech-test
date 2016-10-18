class Key
  @all = []

  class << self 
    attr_accessor :all

    def create_or_update(value)
      new(value).tap{|key| all << key}
    end

    def last
      all.last
    end

  end

  def initialize(value)
    @value = value
  end

  def to_s
    @value.to_s
  end

  private_class_method :new, :all, :all=

end
