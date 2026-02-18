let
  laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA5l/UUW0KQzQpqN+04f4QiknEqFJhm1ehXNX61OPQIz nathanfouere@tutanota.com";
  tour = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICAufs2QxpRFDJW6SGMWg0dEev+m6qO5j0liQjkxDS6H nathanfouere@tutanota.com";

  # Ici ajouter les thinkcentre
  #systems = [ ];
in
{
  "tailscale.age".publicKeys = [
    laptop
    tour
  ];
}
