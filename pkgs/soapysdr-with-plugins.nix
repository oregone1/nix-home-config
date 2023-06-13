{soapysdr}: let
  soapysdr-with-plugins = soapysdr.override { 
    extraPackages = [
      soapysdrplay
      soapyrtlsdr
      soapyremote
    ];
  };
in pkgs
