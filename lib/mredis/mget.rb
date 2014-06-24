module Mredis
  module Mget
    def self.mget(objects, str) 
      hash = Hash.new
      return hash if objects.blank?
      result =  begin
                  $redis.mget(generate_key_for_mget(objects, str))
                rescue => e
                  Rails.logger.error "Redis server error: #{e.message}"
                  objs = objects.first.class == Spot ? objects.first.class.where(id: objects.map(&:id)).includes(:city=>[:country,:state]) : objects
                  objs.map{|x| x.try(str) }
                end
      list_ids = objects.map(&:id)
      list_ids.each_index do |index|
        hash[list_ids[index].to_s] = result[index].presence || (objects[index].try(str) rescue nil)
      end
      hash
    end

    def self.generate_key_for_mget(objects ,str)
      keys = Array.new
      objects.each do |ob|
        keys << "#{ob.class.base_class.name.downcase}:#{ob.id}:#{str}"
      end 
      keys
    end
  end
end
