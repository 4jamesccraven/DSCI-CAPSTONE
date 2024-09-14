{
  description = "";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system; config.allowUnfree = true;};
    in {
      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [
          python311
        ] ++ (with pkgs.python311Packages; [
          pip
          numpy
          pandas
          matplotlib
          seaborn
          scikit-learn
          jupyterlab
          fastparquet
          python-lsp-server
          jupyterlab-lsp
        ]);
        shellHook = ''
          clear
          PMPT=$PS1
          PS1="(DevShell)\n$PMPT"
        '';
      };
    });
  }
