{
  description = "nix-extract-flake-programs - A script to document and compare packages in Nix configurations.";

  inputs.nixpkgs.url = "nixpkgs";

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
    # Define the default package as a derivation, passing pkgs
    defaultPackage.${system} = import ./default.nix { inherit pkgs; };

    # Define the app for nix run
    apps.${system}.nix-extract-flake-programs = self.defaultPackage.${system};
  };
}
