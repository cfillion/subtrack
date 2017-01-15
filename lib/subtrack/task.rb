class Subtrack::Task
  include Subtrack::TaskList

  def initialize
    @log = []
  end

  attr_accessor :name, :parent

  def active?
    @log.size.odd?
  end

  def inspect
    "#<#{self.class}:#{object_id}>"
  end

  def start(time = DateTime.now)
    if @log.last&.> time
      raise Subtrack::InvalidTime,
        'given time is earlier than the last logged time'
    end

    @log << time
  end
  alias :stop :start
end
