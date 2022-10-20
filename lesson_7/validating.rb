module Validating
  class << self
    def included(base)
      base.include(InstanceMethods)
    end
end

  module InstanceMethods
    TYPES = [:cargo, :passenger]
    FORMAT_TRAIN_NUMBER = /\A[a-zа-я0-9]{3}-?[a-zа-я0-9]{2}\z/i

    def validate_exist(data, title)
      raise ArgumentError, "Argument: #{title} must be non-zero" if data.nil?
    end

    def validate_length(data, title, min_length = 5)
      raise TypeError,
            "Argument: #{title} must be more than #{min_length} characters long" if data.length < min_length
    end

    def validate_type(type)
      raise TypeError, "Argument: type must be cargo or passsenger   NOT #{type}" unless TYPES.include?(type)
    end

    def validate_class_membership(obj, obj_class)
      raise TypeError, "#{obj} is not a class of  #{obj_class}" unless obj.instance_of?(obj_class)
    end

    def validate_train_number(number)
      raise ArgumentError,
            "Argument: number should be in the following format 'XXX-XX'" unless number.match?(FORMAT_TRAIN_NUMBER)
    end

    def valid?
      validate!
      true
    rescue ArgumentError, TypeError
      false
    end
  end
end
