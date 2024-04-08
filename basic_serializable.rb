require 'json'
require 'yaml'
require 'mspack'
# allow for serialization with JSON, YAML, and MessagePack
# currently set for JSON
module BasicSerializable

  @@serializer = JSON

  def serialize
    obj = {}
    instance_variables.map { |var|
      obj[var] = instance_variable_get(var)
    }
    @@serializer.dump obj
  end

  def unserialize(string)
    obj = @@serializer.parse(string)
    obj.keys.each { |key| instance_variable_set(key, obj[key])}
  end
end