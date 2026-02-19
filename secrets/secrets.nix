let
  laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA5l/UUW0KQzQpqN+04f4QiknEqFJhm1ehXNX61OPQIz nathanfouere@tutanota.com";
  tour = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICAufs2QxpRFDJW6SGMWg0dEev+m6qO5j0liQjkxDS6H nathanfouere@tutanota.com";

  # Ici ajouter les thinkcentre
  thinkcentre-1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINFoS7IQ8mdWhwm7TDzE/FQ/Ntl+90xmUPHgozDtx59z nathanf@nixos";
  thinkcentre-2 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ1gmWWXnCxaSEgdYK3rR9vNg9OnSzeLOJ7Cc3cDlRsJ nathanf@nixos";
  systems = [ ];
in
{
  "tailscale.age".publicKeys = [
    laptop
    tour
  ];
}
