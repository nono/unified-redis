module UnifiedRedis
  module Adapter
    class Redis
      def initialize(redis)
        @redis = redis
      end

      def call(command, *args)
        *result = @redis.send(command, *args)
        yield *result if block_given?
        return *result
      end
    end
  end
end
