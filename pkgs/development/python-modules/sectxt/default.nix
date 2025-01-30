{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pythonOlder,
  requests,
  python-dateutil,
  langcodes,
  pgpy-dtc,
  validators,
}:

buildPythonPackage rec {
  pname = "sectxt";
  version = "0.9.6";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-yCMXKHysKR3f/bNVCF3ct28GcHCn/Zpu+81BffkTrJI=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    python-dateutil
    langcodes
    pgpy-dtc
    validators
  ];

  pythonRelaxDeps = [
    "requests"
    "langcodes"
    "pgpy-dtc"
    "validators"
  ];

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/DigitalTrustCenter/sectxt";
    description = "security.txt parser and validator";
    license = licenses.eupl12;
    maintainers = with maintainers; [ networkexception ];
  };
}
