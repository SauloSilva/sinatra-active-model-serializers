module Sinatra
  SERIALIZERS_DEFAULT_PATH = './app/serializers'

  module JSON
    def initialize
      files_required
      super
    end

    def json(resource, options={})
      @_options, @_serializer_options = options.merge(settings.active_model_serializers)

      # if serializer = options.fetch(:serializer, ActiveModel::Serializer.serializer_for(object, options))

      if serializer = get_serializer(resource)
        object = serializer.new(resource, @_serializer_options)
        adapter = ActiveModel::Serializer::Adapter.create(object, @_options)

        super(adapter, options)
      else
        resource.to_json(options)
      end
    end

    def get_serializer(resource)
      _serializer ||= @_serializer_options.delete(:serializer)
      _serializer ||= ActiveModel::Serializer.serializer_for(resource)

      if @_options.key?(:each_serializer)
        @_serializer_options[:serializer] = @_serializer_options.delete(:each_serializer)
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

  Base.set :active_model_serializers, {}
  Base.set :serializers_path, SERIALIZERS_DEFAULT_PATH
end