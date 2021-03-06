require 'chef/resource/lwrp_base'
require 'chef_metal'
require 'chef_metal/machine'
require 'chef_metal/provisioner'

class Chef::Resource::MachineFile < Chef::Resource::LWRPBase
  self.resource_name = 'machine_file'

  def initialize(*args)
    super
    @chef_server = Cheffish.enclosing_chef_server
    @provisioner = ChefMetal.enclosing_provisioner
  end

  actions :upload, :download, :delete, :nothing
  default_action :upload

  attribute :path, :kind_of => String, :name_attribute => true
  attribute :machine, :kind_of => [String, ChefMetal::Machine]
  attribute :local_path, :kind_of => String
  attribute :content

  attribute :chef_server, :kind_of => Hash
  attribute :provisioner, :kind_of => ChefMetal::Provisioner
end
