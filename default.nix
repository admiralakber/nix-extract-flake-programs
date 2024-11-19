{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "nix-extract-flake-programs";
  version = "1.0.0";

  # Source script file
  src = ./nix-extract-flake-programs;

  # Skip unpacking since src is a single file
  unpackPhase = ":";

  # Installation phase: copy the script to $out/bin and make it executable
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/nix-extract-flake-programs
    chmod +x $out/bin/nix-extract-flake-programs
  '';

  # Metadata for the package
  meta = with pkgs.lib; {
    description = "Extract installed packages from a NixOS flake and format them into an Org-mode table.";
    homepage = "https://github.com/admiralakber";
    license = licenses.mit;
    maintainers = [
      {
        name = "Aqeel Akber";
        email = "aqeel@aqeelakber.com";
        github = "admiralakber";
        gitlab = "admiralakber";
      }
    ];
    platforms = platforms.all;
  };
}
