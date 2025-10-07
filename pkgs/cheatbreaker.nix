{
  fetchurl,
  appimageTools,
}:
appimageTools.wrapAppImage rec {
  pname = "cheatbreaker";
  version = "3.0.8";

  src = appimageTools.extract {
    inherit pname version;
    src = fetchurl {
      url = "https://github.com/CheatBreakerNet/Launcher/releases/download/3.0.8/CheatBreaker.AppImage";
      sha256 = "sha256:6e65b08d8e94fac9f507da010af0b77cc57ea7c69391ea9d2c4e9375b5a3749d";
    };
  };

  extraInstallCommands = ''
    install -m 444 -D ${src}/cheatbreaker.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/cheatbreaker.desktop \
      --replace 'Exec=AppRun' 'Exec=cheatbreaker'
    cp -r ${src}/usr/share/icons $out/share
  '';
}
