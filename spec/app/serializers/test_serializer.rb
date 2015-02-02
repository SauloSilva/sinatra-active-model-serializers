class TestSerializer < ActiveModel::Serializer
  attributes :foo, :bar

  def bar
    "bar"
  end
end