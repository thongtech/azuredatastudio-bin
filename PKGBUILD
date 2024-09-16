pkgname=azuredatastudio-bin
_pkgname=azuredatastudio
pkgver=1.49.1
pkgrel=1
pkgdesc="A data management tool that enables you to work with SQL Server, Azure SQL DB and SQL DW. (official prebuilt version)"
arch=('x86_64')
url="https://github.com/Microsoft/azuredatastudio"
license=('custom: microsoft')

depends=('gtk3'
         'libsecret'
         'libxkbfile'
         'nss'
         'openssl')
makedepends=('sed')
optdepends=('krb5: Windows authentication support'
            'xdg-utils: Desktop integration')
conflicts=('azuredatastudio')
options=('staticlibs')

source=("$_pkgname-$pkgver.tar.gz::https://azuredatastudio-update.azurewebsites.net/$pkgver/linux-x64/stable"
        $_pkgname.desktop.in::https://raw.githubusercontent.com/microsoft/azuredatastudio/${pkgver}/resources/linux/code.desktop
        $_pkgname-url-handler.desktop.in::https://raw.githubusercontent.com/microsoft/azuredatastudio/${pkgver}/resources/linux/code-url-handler.desktop
        $_pkgname-workspace.xml.in::https://raw.githubusercontent.com/microsoft/azuredatastudio/${pkgver}/resources/linux/code-workspace.xml
        ${_pkgname}.sh)
sha512sums=('156f8f8852a8f0b92090dfa2843194d9f29fced9951a2e4c0f857ff2d82d1e76a0f57fe8aaefcda5354c9c06d2b4ca98c540413b22fbe08b785c0fc8a2a31e40'
            'c77265cb099a64d33b3e84f9b860c543097b0ab81c94f17fc837be247a8e15325d8cfd1f03fd2994ee07565e7d44672a481898791c57ee5753ad54392929b5f3'
            'c27d9e89d008c5b5f5ef20410b3ff98e3103608fa2244525b511b7adbe22a233092673a74bd8b8a68fa28da1af10d682b3c86c8bacfd36bcc8831e03d2e4e803'
            '21d66f25db8ed6578a204d8530bdd2bba455179a947bd8377024f38a530765a3b6f9eaf678549fa47cf71afc4743784abfbe7a80bf53f2fdc6d5964d6f9ad0a4'
            'b0c2b96257fcbb4a3bfb8059b6a1d58224b043e4d7a337e04b2066849358f0370b4549764ea28c50e8bef21b462741cc3d97d55fbf268b646a0b7504d37515e1')

_set_meta_info() {
  sed 's/@@NAME_LONG@@/Azure Data Studio/g' "$1" |\
    sed 's/@@NAME_SHORT@@/azuredatastudio-url-handler/g' |\
    sed 's/@@NAME@@/azuredatastudio/g' |\
    sed 's#@@EXEC@@#/usr/bin/azuredatastudio#g' |\
    sed 's/@@ICON@@/azuredatastudio/g' |\
    sed 's/@@URLPROTOCOL@@/azuredatastudio/g'
}

_pkg() {
  echo 'azuredatastudio-linux-x64'
}

prepare() {
  _set_meta_info "${srcdir}/${_pkgname}.desktop.in" > "${srcdir}/${_pkgname}.desktop"
  _set_meta_info "${srcdir}/${_pkgname}-url-handler.desktop.in" > "${srcdir}/${_pkgname}-url-handler.desktop"
  _set_meta_info "${srcdir}/${_pkgname}-workspace.xml.in" > "${srcdir}/${_pkgname}-workspace.xml"

  sed -i '/^GenericName=/d' "${srcdir}/${_pkgname}.desktop"
  sed -i '/^GenericName=/d' "${srcdir}/${_pkgname}-url-handler.desktop"
}

package() {
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons"
  install -d "${pkgdir}/usr/share/mime/packages"

  install -m644 "${srcdir}/$(_pkg)/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
  install -m644 "${srcdir}/$(_pkg)/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -m644 "${srcdir}/${_pkgname}-url-handler.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-url-handler.desktop"
  install -m644 "${srcdir}/${_pkgname}-workspace.xml" "${pkgdir}/usr/share/mime/packages/${_pkgname}-workspace.xml"

  cp -r "${srcdir}/$(_pkg)/"* "${pkgdir}/opt/${_pkgname}"

  # Launcher
  install -m755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
