# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>

pkgname=cachyos-i3wm-settings
pkgdesc='CachyOS i3wm settings'
pkgver=1.0.1
pkgrel=2
arch=('any')
url="https://github.com/cachyos/$pkgname"
license=('GPL')
makedepends=('coreutils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('662417f18fca1883b3708f7a6c17e3cfb07d1a1fb2efaa3658ca26289930cde1222cdf99d6f8aca4f582e27c2a50557eb9bfd8f42c9adf93fbfe8449ec405c9d')
depends=('cachyos-zsh-config'
         'cachyos-picom-config'
         'feh'
         'pamixer'
         'i3lock-color'
         'polkit-gnome'
         'dunst'
         'rofi'
         'jq'
         'polybar'
         'xob'
         'dex'
         'capitaine-cursors'
         'nerd-fonts-fantasque-sans-mono'
         'noto-fonts'
         'ttf-hack'
         'ttf-fira-sans'
         'cachyos-nord-gtk-theme-git')
install=$pkgname.install
provides=('cachyos-desktop-settings')
conflicts=('cachyos-desktop-settings')

package() {
    install -d $pkgdir/etc
    cp -rf $srcdir/$pkgname-$pkgver/etc $pkgdir
}
