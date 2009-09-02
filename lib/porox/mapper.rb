require 'builder'

module Porox
  class Mapper
    def initialize
    end

    def register(klass)
    end

    def to_ruby(xml)
      document = Hpricot(xml)
      root = (document / "/*").to_a[0]
      class_name = root.name
      class_name.gsub!(/-([a-z])/) { |s| s.upcase[1,1] }
      class_name.gsub!(/^([a-z])/) { |s| s.upcase }
      klass = Object.const_get(class_name)
      instance = klass.new
      root.attributes.each do |name, value|
        instance.send("#{name}=", value)
      end
      instance
    end

    def to_xml(object)
      klass = object.class

      attribute_hash = {}
      (klass.public_instance_methods - klass.superclass.public_instance_methods).each { |method_name|
        next if method_name.to_s =~ /(=|\?)$/
        attribute_hash[method_name.to_s] = object.send(method_name)
      }

      xml_root = klass.name.to_s
      xml_root.gsub!(/([A-Z])/, '-\1')
      xml_root.gsub!(/^-/, '')
      xml_root.downcase!

      buffer = ""
      xml = Builder::XmlMarkup.new(:target => buffer)
      xml.instruct!
      xml.tag!(xml_root, attribute_hash)
      buffer
    end
  end
end
