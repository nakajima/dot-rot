{ pkgs, ... }: {
  # Cool it.
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      zlib
      openssl
      curl
      # etc
    ];
  };

  nix.settings.experimental-features = "nix-command flakes";

  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nakajima = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "nakajima";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.tailscale.enable = true;

  environment.systemPackages = with pkgs; [ wget ];
}
