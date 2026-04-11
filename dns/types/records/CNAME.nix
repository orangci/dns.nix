#
# SPDX-FileCopyrightText: 2019 Kirill Elagin <https://kir.elagin.me/>
#
# SPDX-License-Identifier: MPL-2.0 or MIT
#

# RFC 1035, 3.3.1

{ lib }:

let
  inherit (lib) dns mkOption types;

in

{
  rtype = "CNAME";
  options = {
    cname = mkOption {
      type = dns.types.domain-name;
      example = "www.test.com";
      description = "A <domain-name> which specifies the canonical or primary name for the owner. The owner name is an alias";
    };
    cloudflareProxy = mkOption {
      type = types.bool;
      default = false;
      description = "Whether this record should be proxied by Cloudflare";
    };
  };
  dataToString = { cname, ... }: "${cname}";
  fromString = cname: { inherit cname; };
}
