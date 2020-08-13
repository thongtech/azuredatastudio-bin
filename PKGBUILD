# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=azuredatastudio-bin
_pkgname=azuredatastudio
pkgver=1.21.0
pkgrel=1
pkgdesc="Azure Data Studio is a data management tool that enables you to work with SQL Server, Azure SQL DB and SQL DW (official prebuilt version)"
arch=('x86_64')
url="https://github.com/Microsoft/azuredatastudio"
license=('custom: microsoft')
depends=('curl' 'gcc-libs' 'glibc' 'gnupg' 'gtk3' 'libnotify' 'libsecret' 'libxkbfile' 'libxss' 'lsof' 'nss')
makedepends=('sed')
optdepends=('krb5: Windows authentication support')
conflicts=('azuredatastudio')
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://go.microsoft.com/fwlink/?linkid=2138706"
        "${_pkgname}.desktop")
sha256sums=('7c89304adefa5aaa5ac146da3128bce817f2a71ff51d78725d5432dc06323ed1'
            '460ef23631450298409a96c75662428ffc356b666eefbab813e78ef71e346727')

package() {
  install -d "${pkgdir}/opt/${_pkgname}"
  cp -a "azuredatastudio-linux-x64/"* "${pkgdir}/opt/${_pkgname}"

  # Symlink the startup script in /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/bin/azuredatastudio" "${pkgdir}/usr/bin/${_pkgname}"

  # Add the icon and desktop file
  install -D -m644 "azuredatastudio-linux-x64/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -D -m644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Install the license file
  install -D -m644 "azuredatastudio-linux-x64/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
