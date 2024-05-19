# aladdin4nix

aladdin-2fa-desktop for nixOS or any distro if the Nix package manager is installed on it.

### Aladdin-2fa-desktop [from official site](https://www.aladdin-rd.ru/catalog/aladdin-2fa/)
Aladdin 2FA
Solution for PUSH and OTP authentication and management of user mobile authenticators,
extending the capabilities of the JaCarta Authentication Server (JAS)

You can try the solution in action at [demo portal Aladdin 2FA](https://a2fa-mt.a-rd.ru/)

Aladdin 2FA with JaCarta Authentication Server will allow you to implement two-factor authentication scenarios for:

- remote access gateways (Microsoft, Cisco, Citrix, Palo Alto, Check Point, VMware, Fortinet, NGate, etc. - the list is constantly growing);
- gateways to Microsoft desktops (Microsoft RDG);
- corporate systems (CRM, portals, email, etc.), including Microsoft SharePoint and Microsoft Outlook Web App;
- web applications, websites and cloud services;
- remote banking systems (RBS) and electronic document management.

## Problem:
aladdin-2fa-desktop available for:
- Android
- iOS
- Windows
- Linux **(x64 only for dpkg or rpm based distro)**

If you use the app only to gain access to the corporate segment and
do not want to install it on your personal phone and your main OS is Linux,
you will need a dpkg or rpm-based distribution.

In fact, of course, this is not such a problem since such distributions are very common.

But if you use Arch, NixOS, Void, etc... you need to adapt the dpkg package
from the developer to your package manager.

## Solution:

Nix of course :)

Nix is ​​a great tool for adding packages to your system that your distribution doesn't provide.
Nix is ​​available on most distributions out of the box
or can be easily installed using [the official script](https://nixos.org/download/#download-nix).
