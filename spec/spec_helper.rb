require 'spec'
require File.dirname(__FILE__) + '/../init'

require 'porox/matcher'

def have_tag(desired_tag)
  Porox::Matcher::HaveTag.new(desired_tag)
end
