### DHCP server/client replaced

The dhcp software package has become unmaintained and thus has been functionally
replaced by dhcpcd (client) and kea (server). You will need to replace references
to the recipe/package names as appropriate - most commonly, at the package level
dhcp-client should be replaced by dhcpcd and dhcp-server should be replaced by kea.
If you have any custom configuration files for these they will need to be adapted
- refer to the upstream documentation for dhcpcd and kea for further details.
