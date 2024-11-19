{
  description = "nix-extract-flake-programs - A script to document and compare packages in Nix configurations.";

  outputs = { self }: {
    # Define the package
    packages.x86_64-linux.default = self.defaultPackage.x86_64-linux;

    # Define the default package
    defaultPackage.x86_64-linux = import ./default.nix;

    # Define an app for direct execution
    apps.default = {
      type = "app";
      program = "${self.defaultPackage.x86_64-linux}/bin/nix-extract-flake-programs";
      description = "Extract and format package lists from Nix configurations for documentation or comparison.";
    };
  };
}
