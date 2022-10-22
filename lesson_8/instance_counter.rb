module InstanceCounter
  class << self
    def included(base)
      base.extend ClassMethods
      base.include InstanceMethods
    end
end

  module ClassMethods
    def instances
      @instances ||= 0
    end

    def add_instance
      @instances = self.instances + 1
    end
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.add_instance
    end
  end
end
