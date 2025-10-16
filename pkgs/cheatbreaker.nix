{
  fetchurl,
  appimageTools,
}:
appimageTools.wrapAppImage rec {
  pname = "cheatbreaker";
  version = "3.1.0";

  src = appimageTools.extract {
    inherit pname version;
    src = fetchurl {
      url = "https://r2.cheatbreaker.net/Launcher/master/Linux/amd64/CheatBreaker.AppImage";
      sha256 = "sha256:01j5fzcc4r5vah4n6cy77392qr24b7vviqviblclr9d65h4ny5cd";
    };
  };

  extraInstallCommands = ''
    install -m 444 -D ${src}/cheatbreaker.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/cheatbreaker.desktop \
      --replace 'Exec=AppRun' 'Exec=cheatbreaker'
    cp -r ${src}/usr/share/icons $out/share
  '';
}
