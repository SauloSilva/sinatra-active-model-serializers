module Sinatra
  SERIALIZERS_DEFAULT_PATH = './app/serializers'

  module JSON
    def initialize
      files_required
      super
    end

    def json(object, options={})
      options = options.merge(settings.active_model_serializers)

      if serializer = options.fetch(:serializer, ActiveModel::Serializer.serializer_for(object, options))
        serializer.new(object, options).to_json
      else
        object.to_json(options)
      end
    end

    def files_required
      return unless settings.serializers_path
      Dir["#{ settings.serializers_path }/**/*.rb"].flatten.sort.each do |file|
        require file
      end
    end
  end

  Base.set :active_model_serializers, {}
  Base.set :serializers_path, SERIALIZERS_DEFAULT_PATH
end