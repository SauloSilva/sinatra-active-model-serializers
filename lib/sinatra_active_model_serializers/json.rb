module Sinatra
  module JSON
    def json(object, options={})
      options = options.merge(settings.active_model_serializers)

      serializer = ActiveModel::Serializer.serializer_for(object, options)

      if serializer
        serializer.new(object, options).to_json
      else
        object.to_json(options)
      end
    end
  end

  Base.set :active_model_serializers, {}
end