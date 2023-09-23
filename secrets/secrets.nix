let
  einherjar =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBlSHFcdTcfzqfHsuO+5NHGoIAkFfSsrkGcTRdq9V9Fh";
in
{
  "einherjar.age".publicKeys = [ einherjar ];
  "btc_onion_address.age".publicKeys = [ einherjar ];
  "btc_onion_port.age".publicKeys = [ einherjar ];
  "btc_pass.age".publicKeys = [ einherjar ];
  "btc_user.age".publicKeys = [ einherjar ];
}
