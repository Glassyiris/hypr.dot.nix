# symbolistic yellow; main pc
{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # kernel
  boot.kernelPackages = pkgs.linuxPackages_lqx;
  # modules to load
  boot.kernelModules = [ "v4l2loopback" ];
  # configure modules loaded by modprobe
  boot.extraModprobeConfig = ''
    options snd-usb-audio max_packs=1 max_packs_hs=1 max_urbs=12 sync_urbs=4 max_queue=18
  '';
  # make modules available to modprobe
  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
  # browser fix on Intel CPUs
  boot.kernelParams = [ "intel_pstate=active" ];

  # bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  # Japanese input using fcitx
  i18n.inputMethod = {
    enabled = "fcitx";
    fcitx.engines = with pkgs.fcitx-engines; [ mozc ];
  };

  networking = {
    hostName = "kiiro";
    interfaces.enp3s0.useDHCP = true;
  };
  networking.firewall.enable = false;

  programs.adb.enable = true;
  programs.steam.enable = true;

  # sound
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
  };

  # use dconf in Home Manager
  services.dbus.packages = [ pkgs.gnome3.dconf ];

  virtualisation.libvirtd.enable = true;
  environment.systemPackages = with pkgs; [ virt-manager ];
}
