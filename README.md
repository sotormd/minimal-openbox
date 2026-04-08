# coffee

_very_ minimal openbox configuration for my NixOS needs

![screenshot](./screenshots/openbox.png)

| category       | stack            |
| -------------- | ---------------- |
| display server | `xorg`           |
| window manager | `openbox`        |
| terminal       | `xterm`          |
| font           | `JetBrains Mono` |

largely inspired by [retro](http://github.com/chocolateBread799/retro)

# usage

1. import `nixosModules.coffee`, example:

   ```nix
   {
     inputs = {
       nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

       # add this flake as an input
       coffee = "github:sotormd/coffee";
       coffee.inputs.nixpkgs.follows = "nixpkgs";
     };

     outputs = inputs: {
       nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
         specialArgs = { inherit inputs; };
         modules = [
           # import the module
           inputs.coffee.nixosModules.coffee

           # your other modules here
           ./configuration.nix
           # ...
         ];
       };
     };
   }
   ```

2. start openbox

   ```bash
   startx
   ```
