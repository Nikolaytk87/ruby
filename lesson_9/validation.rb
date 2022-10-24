module Validation
  class << self
    def included(base)
      base.include(InstanceMethods)
      base.extend(ClassMethods)
    end
  end
  module ClassMethods
    attr_accessor :type_attrs, :format_attrs, :presence_attrs

    def validate(name, check, advanced = nil)
      self.presence_attrs ||= []
      self.format_attrs ||= []
      self.type_attrs ||= []
      var_name = "@#{name}".to_sym
      case check
      when :presence then presence_attrs << [name]
      when :type then type_attrs << [name, advanced]
      when :format then format_attrs << [name, advanced]
      end
    end
  end

  module InstanceMethods
    def validate_type_attr
      self.class.type_attrs.each do |name, cls|
        value = instance_variable_get("@#{name}")
        next  if !value.nil? && value.instance_of?(cls)

        raise ArgumentError, "Value #{name}: #{value} is #{value.class} not #{cls}"
      end
    end

    def validate_format_attr
      self.class.format_attrs.each do |name, regexp|
        value = instance_variable_get("@#{name}")
        next  if value.match?(regexp)

        raise ArgumentError, "Value #{name}: #{value} did not pass the test: #{regexp}"
      end
    end

    def validate_presence_attr
      self.class.presence_attrs.each do |name, _|
        value = instance_variable_get("@#{name}")
        next unless value.nil? || value == ''

        raise ArgumentError,
              "Argument #{name} must be non-zero and not empty string"
      end
    end
  end
end

# def validate_exist(data, title)
#   raise ArgumentError, "Argument: #{title} must be non-zero" if data.nil?
# end

# def validate_empty_volume(amount_of_volume)
#   return if empty_volume >= amount_of_volume

#   raise ArgumentError, "Exception: No such free volume #{amount_of_volume} in this Wagon."
# end

# def validate_empty_seats
#   raise ArgumentError, 'Exception: No more empty seats' if empty_seats.zero?
# end

# def validate_length(data, title, min_length: 5)
#   return unless data.length < min_length

#   raise TypeError, "Argument: #{title} must be more than #{min_length} characters long"
# end

# def validate_type(type)
#   raise TypeError, "Argument: type must be cargo or passsenger   NOT #{type}" unless TYPES.include?(type)
# end

# def validate_class(obj, cls)
#   return unless obj.class != cls

#   raise TypeError,
#         "The Value  #{obj.inspect} must be #{cls}, not #{obj.class}"
# end

# def validate_class_membership(obj, obj_class)
#   raise TypeError, "#{obj} is not a class of  #{obj_class}" unless obj.instance_of?(obj_class)
# end

# def validate_train_number(number)
#   return if number.match?(FORMAT_TRAIN_NUMBER)

#   raise ArgumentError, "Argument: number should be in the following format 'XXX-XX'"
# end
