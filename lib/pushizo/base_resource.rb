# frozen_string_literal: true

module Pushizo
  # Üretilmiş kaynak sınıflarının tabanı.
  class BaseResource
    def initialize(client)
      @client = client
    end

    def inspect
      "#<#{self.class.name}>"
    end
  end
end
