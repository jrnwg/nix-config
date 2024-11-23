{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            primary = {
              size = "100%";
              content = {
                type = "lvm_pv";
                vg = "lvm";
              };
            };
          };
        };
      };
    };
    lvm_vg = {
      lvm = {
        type = "lvm_vg";
        lvs = {
          swap = {
            size = "8G";
            content = {
              type = "swap";
              resumeDevice = true;
            };
          };
          root = {
            size = "30G";
            content = {
              type = "filesystem";
              format = "btrfs";
              mountpoint = "/";
              mountOptions = [ "defaults" ];
            };
          };
          home = {
            size = "100%FREE";
            content = {
              type = "filesystem";
              format = "btrfs";
              mountpoint = "/home";
            };
          };
        };
      };
    };
  };
}

