module FillPdf
  module Utilities

    module_function

    ##
    # Cross-platform way of finding an executable in the $PATH.
    #
    # @example
    #   FillPdf::Utilities.which('ruby') #=> "/usr/bin/ruby"
    #
    def which(cmd)
      exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
      ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
        exts.each do |ext|
          exe = File.join(path, "#{cmd}#{ext}")
          return exe if File.executable? exe
        end
      end
      nil
    end

  end
end
