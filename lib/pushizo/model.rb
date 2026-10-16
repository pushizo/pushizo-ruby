# frozen_string_literal: true

require "json"

module Pushizo
  # Çalışma zamanı tip dönüşümü: API yanıtlarını model sınıflarına, istek gövdelerini JSON uyumlu hash'e çevirir.
  # Tip tanımı: :string, :integer, :number, :boolean, :binary, :any, [:array, T], [:map, T] veya model sınıf adı (String).
  module Types
    module_function

    def coerce(value, type)
      return value if value.nil?

      case type
      when String
        klass = Pushizo::Models.const_get(type)
        value.is_a?(Hash) ? klass.new(value) : value
      when Array
        kind, inner = type
        if kind == :array && value.is_a?(Array)
          value.map { |v| coerce(v, inner) }
        elsif kind == :map && value.is_a?(Hash)
          value.each_with_object({}) { |(k, v), h| h[k.to_s] = coerce(v, inner) }
        else
          value
        end
      else
        value
      end
    end

    # Model, sembol anahtarlı hash ve iç içe yapıları JSON uyumlu (string anahtarlı) değere çevirir.
    def serialize(value)
      case value
      when BaseModel then serialize(value.to_h)
      when Hash then value.each_with_object({}) { |(k, v), h| h[k.to_s] = serialize(v) }
      when Array then value.map { |v| serialize(v) }
      when Symbol then value.to_s
      else value
      end
    end
  end

  # Hash tabanlı model: alanlara snake_case okuyucu/yazıcı ve [] ile erişilir; bilinmeyen alanlar korunur.
  #
  #   msg = hs.notifications.get("msg_1")
  #   msg.status          # => "completed"
  #   msg["status"]       # => "completed"
  #   msg.to_h            # => { "id" => …, "status" => … }
  class BaseModel
    class << self
      # JSON adı => [metot adı, tip]
      def fields
        @fields ||= {}
      end

      def field(json_name, method_name, type)
        fields[json_name] = [method_name, type]
        define_method(method_name) { Pushizo::Types.coerce(@attributes[json_name], type) }
        define_method(:"#{method_name}=") { |v| @attributes[json_name] = Pushizo::Types.serialize(v) }
      end

      # JSON adına veya metot adına göre JSON anahtarı.
      def json_key(key)
        name = key.to_s
        return name if fields.key?(name)

        found = fields.find { |_json, (method, _type)| method.to_s == name }
        found ? found[0] : name
      end
    end

    def initialize(attributes = {})
      @attributes = {}
      (attributes || {}).each { |k, v| @attributes[self.class.json_key(k)] = Pushizo::Types.serialize(v) }
    end

    # JSON veya metot adıyla okuma (model alanları model nesnesine çevrilir).
    def [](key)
      json = self.class.json_key(key)
      entry = self.class.fields[json]
      entry ? Pushizo::Types.coerce(@attributes[json], entry[1]) : @attributes[json]
    end

    def []=(key, value)
      @attributes[self.class.json_key(key)] = Pushizo::Types.serialize(value)
    end

    def key?(key)
      @attributes.key?(self.class.json_key(key))
    end

    # JSON adlarıyla ham hash (derin kopya).
    def to_h
      Marshal.load(Marshal.dump(@attributes))
    end
    alias to_hash to_h

    def to_json(*args)
      @attributes.to_json(*args)
    end

    def ==(other)
      other.class == self.class && other.to_h == to_h
    end
    alias eql? ==

    def hash
      [self.class, @attributes].hash
    end

    def inspect
      "#<#{self.class.name} #{@attributes.inspect}>"
    end
    alias to_s inspect
  end
end
