require 'spec'
require 'porox/matcher'

def have_tag(desired_tag)
  Porox::Matcher::HaveTag.new(desired_tag)
end
