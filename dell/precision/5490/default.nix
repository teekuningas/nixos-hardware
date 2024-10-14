{ lib, ... }:
{
  imports = [
    ../../../common/gpu/nvidia/ada-lovelace
  ];

  # boot.kernelParams = lib.mkIf (lib.versionOlder config.boot.kernelPackages.kernel "6.7")  [ "i915.force_probe=7d55" ];
  #boot.kernelPackages = lib.mkIf (lib.versionOlder pkgs.linux.version "6.7") (lib.mkDefault pkgs.linuxPackages_latest);

  boot.kernelParams = builtins.trace boot.kernelPackages.kernel [ "i915.force_probe=7d55" ];

  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };
}
