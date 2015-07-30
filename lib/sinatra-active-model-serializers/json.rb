module Sinatra
  SERIALIZERS_DEFAULT_PATH = './app/serializers'

  module JSON
    def initialize
      files_required
      super
    end

    def json(resource, options = {})
      @_options = settings.active_model_serializers.merge(options)

      if serializer = get_serializer(resource)
        serializer.new(resource, @_options).to_json
      else
        resource.to_json(@_options)
      end
    end

    def get_serializer(resource)
      _serializer ||= @_options.delete(:serializer)
      _serializer ||= ActiveModel::Serializer.serializer_for(resource)

      if @_options.key?(:each_serializer)
        @_options[:serializer] = @_options.fetch(:each_serializer)
      end

      _serializer
    end

    def files_required
      return unless settings.serializers_path
      Dir["#{ settings.serializers_path }/**/*.rb"].flatten.sort.each do |file|
        require file
      end
    end
  end

  Base.set :active_model_serializers, root: true
  Base.set :serializers_path, SERIALIZERS_DEFAULT_PATH
end