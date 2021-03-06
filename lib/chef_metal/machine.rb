module ChefMetal
  class Machine
    def initialize(node)
      @node = node
    end

    attr_reader :node

    # Sets up everything necessary for convergence to happen on the machine.
    # The node MUST be saved as part of this procedure.  Other than that,
    # nothing is guaranteed except that converge() will work when this is done.
    def setup_convergence(provider)
      raise "setup_convergence not overridden on #{self.class}"
    end

    def converge(provider)
      raise "converge not overridden on #{self.class}"
    end


    def execute(provider, command)
      raise "execute not overridden on #{self.class}"
    end

    def read_file(path)
      raise "read_file not overridden on #{self.class}"
    end

    def download_file(provider, path, local_path)
      raise "read_file not overridden on #{self.class}"
    end

    def write_file(provider, path, content)
      raise "write_file not overridden on #{self.class}"
    end

    def upload_file(provider, local_path, path)
      raise "write_file not overridden on #{self.class}"
    end

    def create_dir(provider, path)
      raise "create_dir not overridden on #{self.class}"
    end

    # Delete file
    def delete_file(provider, path)
      raise "delete_file not overridden on #{self.class}"
    end

    # Return true or false depending on whether file exists
    def file_exists?(path)
      raise "file_exists? not overridden on #{self.class}"
    end

    # Return true or false depending on whether remote file differs from local path or content
    def files_different?(path, local_path, content=nil)
      raise "file_different? not overridden on #{self.class}"
    end

    # Set file attributes { mode, :owner, :group }
    def set_attributes(provider, path, attributes)
      raise "set_attributes not overridden on #{self.class}"
    end

    # Get file attributes { :mode, :owner, :group }
    def get_attributes(path)
      raise "get_attributes not overridden on #{self.class}"
    end

    # Forward a remote port to local for the duration of the current connection
    def forward_remote_port_to_local(remote_port, local_port)
      raise "forward_remote_port_to_local not overridden on #{self.class}"
    end

    def disconnect
      raise "disconnect not overridden on #{self.class}"
    end

    # TODO get rid of the provider attribute, that is ridiculous
    # Detect the OS on the machine (assumes the machine is up)
    # Returns a triplet:
    #   platform, platform_version, machine_architecture = machine.detect_os(provider)
    # This triplet is suitable for passing to the Chef metadata API:
    # https://www.opscode.com/chef/metadata?p=#{platform}&pv=#{platform_version}&m=#{machine_architecture}
    def detect_os(provider)
      raise "detect_os not overridden on #{self.class}"
    end
  end
end
