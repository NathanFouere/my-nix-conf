let
  laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA5l/UUW0KQzQpqN+04f4QiknEqFJhm1ehXNX61OPQIz nathanfouere@tutanota.com";
  tour = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPLqKehCp63zveXLYnz+r/3E/orptsNliJfccxejvnlp nathanfouere@tutanota.com";

  thinkcentre-1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINFoS7IQ8mdWhwm7TDzE/FQ/Ntl+90xmUPHgozDtx59z nathanf@nixos";
  thinkcentre-2 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ1gmWWXnCxaSEgdYK3rR9vNg9OnSzeLOJ7Cc3cDlRsJ nathanf@nixos";
  systems = [
    thinkcentre-1
    thinkcentre-2
  ];
in
{
  "tailscale.age".publicKeys = [
    laptop
    tour
  ]
  ++ systems;
}
