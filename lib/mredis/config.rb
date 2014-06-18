module KdaGem
  module Config
    OPTION_KEYS = [
      :host,
      :port,
      :db
    ]
    attr_accessor *OPTION_KEYS

    def configure
      yield self
      $redis_search = Redis.new(:host => host, :port => port, :db => db)
    end
  end
end
