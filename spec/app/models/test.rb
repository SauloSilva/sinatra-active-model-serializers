class Test
  include ActiveModel::Serializers::JSON

  attr_accessor :foo

  def initialize(options)
    @foo = options[:foo]
  end
end