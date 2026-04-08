{
  description = "very minimal openbox for my nixos needs";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    { self, ... }@inputs:
    {
      nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          self.nixosModules.coffee
        ];
      };

      nixosModules.coffee = _: { imports = [ ./wm.nix ]; };

    };
}
