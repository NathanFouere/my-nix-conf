{
  ...
}:
{
  age = {
    identityPaths = [ "/home/nathanf/.ssh/id_ed25519" ];
    secrets.tailscale.file = ../../.secrets/tailscale.age;
  };
}
