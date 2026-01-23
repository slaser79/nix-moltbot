{ lib
, stdenvNoCC
, fetchzip
}:

stdenvNoCC.mkDerivation {
  pname = "clawdbot-app";
  version = "2026.1.22";

  src = fetchzip {
    url = "https://github.com/clawdbot/clawdbot/releases/download/v2026.1.22/Clawdbot-2026.1.22.zip";
    hash = "sha256-IXb+WNrSqH80mYOR62rRK+mJUhReJ+CZVPNFefgkcao=";
    stripRoot = false;
  };

  dontUnpack = true;

  installPhase = "${../scripts/clawdbot-app-install.sh}";

  meta = with lib; {
    description = "Clawdbot macOS app bundle";
    homepage = "https://github.com/clawdbot/clawdbot";
    license = licenses.mit;
    platforms = platforms.darwin;
  };
}
