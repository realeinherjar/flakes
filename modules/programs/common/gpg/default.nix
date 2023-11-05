{ config, pkgs, ... }: {
  programs.gpg = {
    package = pkgs.gnupg;
    settings = {
      # This is an implementation of the Riseup OpenPGP Best Practices
      # https://help.riseup.net/en/security/message-security/openpgp/best-practices
      default-key = "0x7D8FCB8DE55EF33F!";
      no-emit-version = true;
      no-comments = true;
      keyid-format = "0xlong";
      with-fingerprint = true;
      list-options = "show-uid-validity";
      verify-options = "show-uid-validity";
      use-agent = true;
      keyserver = "hkps://keys.openpgp.org/";
      keyserver-options = "no-honor-keyserver-url include-revoked";
      personal-cipher-preferences = "AES256 AES192 AES CAST5";
      personal-digest-preferences = "SHA512 SHA384 SHA256 SHA224";
      cert-digest-algo = "SHA512";
      default-preference-list =
        "SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed";
    };
  };
  services = {
    gpg-agent = {
      enable = true;
      pinentryFlavor = "gnome3";
      defaultCacheTtl = 600;
      maxCacheTtlSsh = 7200;
    };
  };
}
