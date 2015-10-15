module Mongoid
  module Document   

    def serializable_hash(options={})
      attrs = super
      attrs.keys.each do |key|
        attrs[key] = attrs.delete(key).to_s if key =~ /.*\_id$/
      end
      attrs
    end

  end
end