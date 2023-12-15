{
  description = "A very basic flake";

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config = {allowUnfree = true;};
    };
  in {
    devShell.${pkgs.system} = pkgs.mkShell {
      buildInputs = with pkgs; [
        go
        gopls
        gotools
        go-tools
      ];
    };
  };
}
