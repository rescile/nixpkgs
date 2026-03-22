{ stdenv, lib, fetchurl }:

stdenv.mkDerivation rec {
  pname = "rescile-ce";
  version = "0.1.127";

  src = fetchurl {
    url = "https://updates.rescile.com/v${version}/${pname}-linux-amd64";
    sha256 = "89062ac2ae8294ec14123548c5dc73f1d0e0816284c99a93328a54320f145fb3";
  };

  # Since the source is a single binary, we don't need to unpack it
  unpackPhase = ''
    runHook preUnpack
    cp $src ${pname}
    runHook postUnpack
  '';

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    install -d 755
  '';

  meta = with lib; {
    description = "A centralized management system that stores, manages, and deploys system configurations and cloud topologies from a single location. It streamlines administration, ensures consistency across environments, and reduces errors by automating updates through a centralized resource Graph.";
    homepage = "https://www.rescile.com";
    license = licenses.unfree;
    platforms = platforms.unix;
  };
}
