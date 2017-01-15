module Subtrack::TaskList
  NAME_SEPARATOR = '/'
  RESERVED_NAMES = %w{__log}

  def split_name(full_name)
    parts = full_name.split NAME_SEPARATOR

    if parts.empty? || parts.any? {|p| p.empty? || RESERVED_NAMES.include?(p) }
      raise Subtrack::InvalidName, 'invalid task name'
    end

    parts
  end
  module_function :split_name

  def has_tasks?; !tasklist.empty? end
  def [](key) tasklist[key] end
  def []=(key, value) tasklist[key] = value end

  def descend(full_name)
    if block_given?
      parent = self
      split_name(full_name).each {|name|
        parent[name] ||= Subtrack::Task.new
        yield parent = parent[name]
      }
    else
      enum_for :descend, full_name
    end
  end

private
  def tasklist
    @tasklist ||= {}
  end
end
