module Sinatra
  module ActiveModelSerializers
    def json(object, options={})
      options = options.merge(settings.active_model_serializers_options)

      serializer = ActiveModel::Serializer.serializer_for(object, options)

      if serializer
        serializer.new(object, options).to_json
      else
        object.to_json(options)
      end
    end

    def self.files_required(app)
      return unless app.settings.active_model_serializers_path
      Dir["#{ app.settings.active_model_serializers_path }/**/*.rb"].flatten.sort.each do |file|
        require file
      end
    end

    def self.registered(app)
      app.extend Sinatra
      app.helpers ActiveModelSerializers
      files_required(app)
    end
  end

  Base.set :active_model_serializers_options, { root: false }
  Base.set :active_model_serializers_path, false
end