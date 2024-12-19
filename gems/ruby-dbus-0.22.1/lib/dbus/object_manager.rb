# frozen_string_literal: true

# This file is part of the ruby-dbus project
# Copyright (C) 2022 José Iván López González
# Copyright (C) 2022 Martin Vidner
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License, version 2.1 as published by the Free Software Foundation.
# See the file "COPYING" for the exact licensing terms.

module DBus
  # A mixin for {DBus::Object} implementing
  # {https://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager
  # org.freedesktop.DBus.ObjectManager}.
  #
  # {Service#export} and {Service#unexport} will look for an ObjectManager
  # parent in the path hierarchy. If found, it will emit InterfacesAdded
  # or InterfacesRemoved, as appropriate.
  module ObjectManager
    OBJECT_MANAGER_INTERFACE = "org.freedesktop.DBus.ObjectManager"

    # @return [Hash{ObjectPath => Hash{String => Hash{String => Data::Base}}}]
    #   object -> interface -> property -> value
    def managed_objects
      # FIXME: also fix the "service" concept
      descendant_objects = @service.descendants_for(path)
      descendant_objects.each_with_object({}) do |obj, hash|
        hash[obj.path] = obj.interfaces_and_properties
      end
    end

    # @param object [DBus::Object]
    # @return [void]
    def object_added(object)
      InterfacesAdded(object.path, object.interfaces_and_properties)
    end

    # @param object [DBus::Object]
    # @return [void]
    def object_removed(object)
      InterfacesRemoved(object.path, object.intfs.keys)
    end

    def self.included(base)
      base.class_eval do
        dbus_interface OBJECT_MANAGER_INTERFACE do
          dbus_method :GetManagedObjects, "out res:a{oa{sa{sv}}}" do
            [managed_objects]
          end

          dbus_signal :InterfacesAdded, "object:o, interfaces_and_properties:a{sa{sv}}"
          dbus_signal :InterfacesRemoved, "object:o, interfaces:as"
        end
      end
    end
  end
end
