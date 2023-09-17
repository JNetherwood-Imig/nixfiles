{
    inputs = {
        nixpkgs.url = "github:NixOs/nixpkgs/";
    };

    outputs = { nixpkgs, ... }: {
        nixosConfigurations = {
            redpoint = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./hosts/redpoint/configuration.nix
                ];
            };
        };
    };
}