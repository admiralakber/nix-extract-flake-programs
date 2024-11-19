{
  description = "nix-extract-flake-programs - A script to document and compare packages in Nix configurations.";

  outputs = { self, ... }: {
    # Define the default package
    defaultPackage.x86_64-linux = import ./default.nix;

    # Define the package as an app
    packages.x86_64-linux.default = pkgs: pkgs.stdenv.mkApp {
      drv = self.defaultPackage.x86_64-linux;
      program = "${self.defaultPackage.x86_64-linux}/bin/nix-extract-flake-programs";
      description = "Extract and format package lists from Nix configurations for documentation or comparison.";
    };
  };
}
