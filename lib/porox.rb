module Porox
  VERSION = "0.0.1"

  def Porox.lib_dir
    File.expand_path(File.dirname(__FILE__))
  end

  def Porox.add_to_load_path
    $:.unshift(Porox.lib_dir) if !Porox.in_load_path?
  end

  def Porox.in_load_path?
    $:.any? { |lib_dir| File.expand_path(lib_dir) == Porox.lib_dir }
  end
end
