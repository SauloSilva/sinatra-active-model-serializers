module RequestSupport
  def response_body
    JSON.parse last_response.body
  end

  def match_response_schema(schema, options={})
    default_optitons = { strict: true, validate_schema: true }
    schema_directory = "#{ Dir.pwd }/spec/schemas"
    schema_path = "#{ schema_directory }/#{ schema }.json"

    JSON::Validator.clear_cache
    JSON::Validator.validate!(schema_path, response_body, default_optitons.merge(options))
  end
end
