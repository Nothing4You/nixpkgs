{ lib, fetchFromGitHub, fetchpatch2 }:
let
  version = "0.23.1";
in
{
  inherit version;

  src = fetchFromGitHub {
    owner = "Donkie";
    repo = "Spoolman";
    rev = "v${version}";
    hash = "sha256-Oa/cNmpc0hWRf0EQI5aXIE/p9//Sos5Nj3QFEjKgj5o=";
  };

  # TODO: remove this with the next version bump, it's included since 0.24.0
  patches = [
    (fetchpatch2 {
      name = "fix-starlette-file-response.patch";
      url = "https://github.com/Donkie/Spoolman/commit/d9fd44eab95b6dc6c6ded6b6ff69063437dc0735.diff?full_index=1";
      hash = "sha256-Iczh5cdZ2zU589oJwcOusrMJxtYCGe1qIVYD91HKt+o=";
    })
  ];

  meta = {
    description = "Keep track of your inventory of 3D-printer filament spools";
    homepage = "https://github.com/Donkie/Spoolman";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      MayNiklas
      pinpox
    ];
    mainProgram = "spoolman";
  };
}
