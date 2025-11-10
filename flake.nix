{
  description = "A beautifully random bonsai tree generator";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = {
          cbonsai = pkgs.stdenv.mkDerivation {
            pname = "cbonsai";
            version = "1.3.1";

            src = ./.;

            buildInputs = [ pkgs.ncurses ];

            makeFlags = [ "PREFIX=$(out)" ];

            meta = with pkgs.lib; {
              description = "A beautifully random bonsai tree generator written in C using ncurses";
              homepage = "https://gitlab.com/jallbrit/cbonsai";
              license = licenses.gpl3Plus;
              platforms = platforms.unix;
              mainProgram = "cbonsai";
            };
          };

          default = self.packages.${system}.cbonsai;
        };

        apps = {
          cbonsai = flake-utils.lib.mkApp {
            drv = self.packages.${system}.cbonsai;
          };

          default = self.apps.${system}.cbonsai;
        };

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            ncurses
            gcc
            gnumake
          ];

          shellHook = ''
            echo "cbonsai development environment"
            echo "Run 'make' to build"
          '';
        };
      }
    );
}
