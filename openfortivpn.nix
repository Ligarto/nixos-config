{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.openfortivpn
    pkgs.cifs-utils
    pkgs.samba
  ];

  fileSystems."/mnt/ddv" = {
    device = "//ddv.ull.es/alu0101910284";
    fsType = "cifs";
    options = [
      "noauto" # don't try to mount at boot -- VPN isn't up yet anyway
      "x-systemd.automount"
      "username=alu0101910284"
      "domain=ULL"
      "sec=ntlmssp"
      "uid=1000"
      "gid=100"
      "_netdev"
    ];
  };

}
