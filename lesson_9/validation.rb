module Validation
  class << self
    def included(base)
      base.include(InstanceMethods)
      base.extend(ClassMethods)
    end
  end
  module ClassMethods
    attr_accessor :validation_attrs

    def validate(name, check, advanced = nil)
      self.validation_attrs ||= []
      validation_attrs << [name, check, advanced]
    end
  end

  module InstanceMethods
    def validate!
      self.class.validation_attrs.each do |name, check, advanced|
        value = instance_variable_get("@#{name}")
        case check
        when :presence then validate_presence_attr(name, value)
        when :type then validate_type_attr(name, value, advanced)
        when :format then validate_format_attr(name, value, advanced)
        end
      end
    end

    def valid?
      validate!
      true
    rescue ArgumentError, TypeError
      false
    end

    def validate_type_attr(name, value, cls)
      return if !value.nil? && value.instance_of?(cls)

      raise ArgumentError, "Value #{name}: #{value} is #{value.class} not #{cls}"
    end

    def validate_format_attr(name, value, regexp)
      valid_type = value.instance_of?(String) || value.instance_of?(Symbol)
      return if valid_type && value.match?(regexp)

      raise ArgumentError, "Value #{name}: #{value} did not pass the test: #{regexp}"
    end

    def validate_presence_attr(name, value)
      return unless value.nil? || value == ''

      raise ArgumentError,
            "Argument #{name} must be non-zero and not empty string"
    end
  end
end
