{
  description = "very minimal openbox for my nixos needs";
  outputs = _: { nixosModules.coffee = _: { imports = [ ./wm.nix ]; }; };
}
