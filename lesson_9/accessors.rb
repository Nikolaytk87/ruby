require_relative 'validating'
module Accessors
  class << self
    def included(base)
      base.extend(ClassMethods)
      base.include(InstanceMethods)
    end
end

  module ClassMethods
    include Validating
    @@values = []
    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        define_method(name) { instance_variable_get(var_name) }
        define_method("#{name}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          @@values << value
        end
        define_method("#{name}_history") { @@values }
      end
    end

    def strong_attr_accessor(attr_name, attr_class)
      name = "@#{attr_name}".to_sym
      define_method(attr_name) { instance_variable_get(name) }
      define_method("#{attr_name}=") do |value|
        instance_variable_set(name, value) unless validate_class(value, attr_class)
      end
    end
  end

  module InstanceMethods
  end
end
