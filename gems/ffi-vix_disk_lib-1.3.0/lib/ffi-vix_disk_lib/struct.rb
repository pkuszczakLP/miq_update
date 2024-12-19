require 'ffi'

module FFI
  module VixDiskLib
    module API
      extend FFI::Library

      # Geometry
      class Geometry < FFI::Struct
        layout :cylinders, :uint32,
               :heads,     :uint32,
               :sectors,   :uint32
      end

      # CreateParams
      class CreateParams < FFI::Struct
        layout :diskType,    DiskType,
               :adapterType, AdapterType,
               :hwVersion,   :uint16,
               :capacity,    :SectorType
      end

      class UidPasswdCreds < FFI::Struct
        layout :userName, :pointer,      # User id and password on the
               :password, :pointer       # VC/ESX host.
      end

      class SessionIdCreds < FFI::Struct # Not supported in 1.0
        layout :cookie,          :pointer,
               :sessionUserName, :pointer,
               :key,             :pointer
      end

      class TicketIdCreds < FFI::Struct  # Internal use only.
        layout :dummy, :char
      end

      class Creds < FFI::Union
        layout :uid,       UidPasswdCreds,
               :sessionId, SessionIdCreds,
               :ticketId,  TicketIdCreds
      end

      # ConnectParams - Connection setup parameters.
      #
      # vmxSpec is required for opening a virtual disk on a datastore through
      # the Virtual Center or ESX server.
      # vmxSpec is of the form:
      # <vmxPathName>?dcPath=<dcpath>&dsName=<dsname>
      # where
      # vmxPathName is the fullpath for the VMX file,
      # dcpath is the inventory path of the datacenter and
      # dsname is the datastore name.
      #
      # Inventory path for the datacenter can be read off the Virtual Center
      # client's inventory tree.
      #
      # Example VM spec:
      # "MyVm/MyVm.vmx?dcPath=Path/to/MyDatacenter&dsName=storage1"
      class ConnectParams_1_0_0 < FFI::Struct
        layout :vmxSpec,    :pointer, # URL like spec of the VM.
               :serverName, :pointer, # Name or IP address of VC / ESX.
               :thumbPrint, :pointer, # SSL Certificate thumb print.
               :privateUse, :long,    # This value is ignored.
               :credType,   CredType,
               :creds,      Creds,
               :port,       :uint32   # port to use for authenticating with VC/ESXi host
      end

      class ConnectParams_6_5_0 < FFI::Struct
        layout :vmxSpec,     :pointer, # URL like spec of the VM.
               :serverName,  :pointer, # Name or IP address of VC / ESX.
               :thumbPrint,  :pointer, # SSL Certificate thumb print.
               :privateUse,  :long,    # This value is ignored.
               :credType,    CredType,
               :creds,       Creds,
               :port,        :uint32,  # port to use for authenticating with VC/ESXi host
               :nfcHostPort, :uint32,  # port to use for establishing NFC connection to ESXi host
               :vimApiVer,   :pointer  # VIM API version to use, private
      end

      class Info < FFI::Struct
        layout :biosGeo,            Geometry.by_value, # BIOS geometry for booting and partitioning
               :physGeo,            Geometry.by_value, # physical geometry
               :capacity,           :SectorType,       # total capacity in sectors
               :adapterType,        AdapterType,       # adapter type
               :numLinks,           :int,              # number of links (i.e. base disk + redo logs)
               :parentFileNameHint, :pointer,          # parent file for a redo log
               :uuid,               :pointer           # disk UUID
      end

      class HandleStruct < FFI::Struct
        layout :dummy, :char
      end

      class ConnectParam < FFI::Struct
        layout :dummy, :char
      end
    end
  end
end
