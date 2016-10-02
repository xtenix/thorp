require_relative 'thorp'

class Object
  def meta_def name, &blk
    (class << self; self; end).instance_eval { define_method name, &blk }
  end
end

$runner = Thor::Base.subclasses.detect { |klass| klass.namespace.end_with?("cli:runner") }
$command_namespace = $runner.command_namespace

Thor::Util.meta_def('namespace_from_thor_class') { |constant|
  constant = constant.to_s.gsub(/^#{$command_namespace.to_s}::/, "")
  constant = snake_case(constant).squeeze(":")
  constant
}
Thor::Util.meta_def('load_thorfile') { |path, content = nil, debug = false|
  content ||= File.binread(path)
  begin
    $command_namespace.class_eval(content, path)
  rescue StandardError => e
    $stderr.puts("WARNING: unable to load thorfile #{path.inspect}: #{e.message}")
    if debug
      $stderr.puts(*e.backtrace)
    else
      $stderr.puts(e.backtrace.first)
    end
  end
}
$runner.start(ARGV)
