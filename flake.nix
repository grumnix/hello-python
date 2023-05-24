{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pythonPackages = pkgs.python310Packages;
      in rec {
        packages = rec {
          default = hello-python;

          hello-python = pythonPackages.buildPythonPackage rec {
            name = "hello-python";
            version = "0.1.0";

            src = ./.;
          };
        };

        apps = rec {
          default = flake-utils.lib.mkApp {
            drv = packages.hello-python;
            exePath = "/bin/hello-python";
          };
        };
      }
    );
}
