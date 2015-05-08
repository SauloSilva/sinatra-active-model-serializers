module Sinatra
  module ActiveModelSerializer
    def json(object, options={})
      options = options.merge(settings.active_model_serializers)

      serializer = ActiveModel::Serializer.serializer_for(object, options)

      if serializer
        serializer.new(object, options).to_json
      else
        object.to_json(options)
      end
    end

    def self.files_required(app)
      return unless app.settings.serializers_path
      Dir["#{ app.settings.serializers_path }/**/*.rb"].flatten.sort.each do |file|
        require file
      end
    end

    def self.registered(app)
      app.extend Sinatra
      app.helpers ActiveModelSerializer

      #Default values
      app.set :serializers_path, './app/serializers'
      app.set :active_model_serializers, { root: false }

      files_required(app)
    end
  end
end