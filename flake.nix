{
  inputs = { nixpkgs.url = "github:nixos/nixpkgs"; };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      pythonPackages = with pkgs.python3Packages; [
        asn1crypto
        bcrypt
        cffi
        colorama
        cryptography
        enum34
        idna
        # ipaddress
        paramiko
        prompt-toolkit
        pyasn1
        pycparser
        pygments  # Changed to lowercase
        pynacl    # Changed to lowercase
        scp
        six
        tqdm
        wcwidth
      ];
    in {
      devShell.aarch64-darwin =
        pkgs.mkShell {
          buildInputs = [ pkgs.cowsay pkgs.frida-tools ] ++ pythonPackages;  # Moved frida-tools to top level
        };
    };
}
