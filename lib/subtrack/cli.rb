class Subtrack::CLI
  include Commander::Methods

  def run
    program :name, Subtrack::NAME
    program :version, Subtrack::VERSION
    program :description, Subtrack::SUMMARY

    program :help_formatter, :compact

    command :switch do |c|
      c.syntax = 'switch NAME'
      c.description = 'Switch to a task (stopping active tasks in the parent level)'
      c.action do |args, options|
        name = args.join "\x20"
        Subtrack.new(options.datadir).switch name
      end
    end

    command :start do |c|
      c.syntax = 'start NAME'
      c.description = 'Start a task'
      c.action do |args, options|
        name = args.join "\x20"
        Subtrack.new(options.datadir).start name
      end
    end

    command :stop do |c|
      c.syntax = 'stop [NAME]'
      c.description = 'Stop a task and sub-tasks'
      c.option '-f', '--force', 'Do not stop sub-tasks'
      c.action do |args, options|
        name = args.join "\x20"
        Subtrack.new(options.datadir).stop name, options.force
      end
    end

    default_command :switch
    run!
  end
end
