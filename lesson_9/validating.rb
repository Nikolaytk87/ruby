module Validating
  class << self
    def included(base)
      base.include(InstanceMethods)
    end
end

  module InstanceMethods
    TYPES = %i[cargo passenger]
    FORMAT_TRAIN_NUMBER = /\A[a-zа-я0-9]{3}-?[a-zа-я0-9]{2}\z/i

    def validate_exist(data, title)
      raise ArgumentError, "Argument: #{title} must be non-zero" if data.nil?
    end

    def validate_empty_volume(amount_of_volume)
      return if empty_volume >= amount_of_volume

      raise ArgumentError, "Exception: No such free volume #{amount_of_volume} in this Wagon."
    end

    def validate_empty_seats
      raise ArgumentError, 'Exception: No more empty seats' if empty_seats.zero?
    end

    def validate_length(data, title, min_length: 5)
      return unless data.length < min_length

      raise TypeError, "Argument: #{title} must be more than #{min_length} characters long"
    end

    def validate_type(type)
      raise TypeError, "Argument: type must be cargo or passsenger   NOT #{type}" unless TYPES.include?(type)
    end

    def validate_class(obj, cls)
      return unless obj.class != cls

      raise TypeError,
            "The Value  #{obj.inspect} must be #{cls}, not #{obj.class}"
    end

    def validate_class_membership(obj, obj_class)
      raise TypeError, "#{obj} is not a class of  #{obj_class}" unless obj.instance_of?(obj_class)
    end

    def validate_train_number(number)
      return if number.match?(FORMAT_TRAIN_NUMBER)

      raise ArgumentError, "Argument: number should be in the following format 'XXX-XX'"
    end

    def valid?
      validate!
      true
    rescue ArgumentError, TypeError
      false
    end
  end
end
