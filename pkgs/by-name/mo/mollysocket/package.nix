{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl, sqlite }:

rustPlatform.buildRustPackage rec {
  pname = "mollysocket";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "mollyim";
    repo = "mollysocket";
    rev = "${version}";
    hash = "sha256-9yXC64i5NeSjsLnjgNtA+qkhE7i+Ku1Cu8B9xDajD9Y=";
  };

  cargoHash = "sha256-vqi18y1Z9Fo1P6ihdN1LCK6Trr7fcfzCsQfPNt0MYNk=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
    sqlite
  ];

  checkFlags = [
    # These tests try to contact DNS
    "--skip=config::tests::check_wildcard_endpoint"
    "--skip=utils::post_allowed::tests::test_allowed"
    "--skip=utils::post_allowed::tests::test_not_allowed"
    "--skip=utils::post_allowed::tests::test_post"
    "--skip=ws::tls::tests::connect_untrusted_server"
    "--skip=ws::tls::tests::connect_trusted_server"
  ];

  meta = {
    description = "MollySocket allows getting Signal notifications via UnifiedPush.";
    homepage = "https://github.com/mollyim/mollysocket";
    license = lib.licenses.agpl3Plus;
    maintainers = with lib.maintainers; [ networkexception ];
    mainProgram = "mollysocket";
  };
}
