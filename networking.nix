{
  networking.defaultGateway = "10.0.0.1";
  networking.nameservers =  [ "10.0.0.1" ];
  networking.interfaces.ens18.ipv4.addresses = [
    {
      address = "10.0.230.106";
      prefixLength = 16;
    }
  ];
  networking.enableIPv6 = false;
}
