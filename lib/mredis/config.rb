module Mredis
  module Config
    OPTION_KEYS = [
      :host,
      :port,
      :db
    ]
    attr_accessor *OPTION_KEYS

    def configure
      yield self
      $mredis = Redis.new(:host => host, :port => port, :db => db)
    end
  end
end
