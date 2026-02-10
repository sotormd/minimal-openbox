{
  description = "minimal openbox";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    { self, ... }@inputs:
    {
      nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          self.nixosModules.minimal-openbox
        ];
      };

      nixosModules.minimal-openbox = _: { imports = [ ./wm.nix ]; };

    };
}
