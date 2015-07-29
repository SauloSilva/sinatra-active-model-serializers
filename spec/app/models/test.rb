class Test
  include ActiveModel::Serialization
  attr_accessor :foo

  def initialize(options)
    @foo = options[:foo]
  end
end