class UnitarySerializer < ActiveModel::Serializer
  attributes :foo, :extra

  def extra
    'extra'
  end
end