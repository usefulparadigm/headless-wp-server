# Monkey patch Grape
# Padrino expects route objects to respond to a few HttpRouter::Route methods.
# https://github.com/eivan/PadrinoEatsGrape/issues/2
require 'grape'

class Grape::Router::Route
  def name
    "APIv#{version}"
  end
  def request_methods
    Set.new [request_method]
  end
  def original_path
    path
  end
  def controller
  end
end