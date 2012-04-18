require './my_middleware'
use MyMiddleware::Hello # between require and run
run Proc.new {|env| [200, {"Content-Type" => "text/plain"}, ['Try to access by visiting /hello']] }

# ref: http://rubylearning.org/class/mod/resource/view.php?id=2920
