# Class for handy downloading of remote files 
require 'open-uri'
require 'digest/sha1'

class RemoteFile < ::Tempfile

  def initialize(path, tmpdir = Dir::tmpdir)
    #open(path) do |resp|
    #  @remote_path = resp.base_uri.to_s
    #end

    @remote_path = path

    @original_filename  = File.basename(@remote_path)
    super Digest::SHA1.hexdigest(@remote_path), tmpdir
    fetch
  end

  def fetch
    string_io = OpenURI.send(:open, @remote_path)
    self.binmode
    self.write string_io.read
    self.rewind
    self
  end

  def original_filename
    @original_filename
  end

  def content_type
    mime = `file --mime -br #{self.path}`.strip
    mime = mime.gsub(/^.*: */,"")
    mime = mime.gsub(/;.*$/,"")
    mime = mime.gsub(/,.*$/,"")
    mime
  end
end