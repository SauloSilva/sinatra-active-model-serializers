class FooSerializer < ActiveModel::Serializer
  attributes :bar

  def bar
    "This is a custom serializer - #{ object.class.name }"
  end
end