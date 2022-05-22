# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>

pkgname=cachyos-i3wm-settings
pkgdesc='CachyOS i3wm settings'
pkgver=1.0.1
pkgrel=1
arch=('any')
url="https://github.com/cachyos/$pkgname"
license=('GPL')
makedepends=('coreutils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('f6a1a83d5f7ac43fc0f26d3fa479064497b5fb124b582d1d65fc55b896f8b1f9aa7b2661e6432a45829640e063873169c72ae04e7bbd7a02c7f3a829426394f0')
depends=('cachyos-zsh-config'
         'cachyos-picom-config'
         'feh'
         'pamixer'
         'i3lock-color'
         'polkit-gnome'
         'dunst'
         'rofi'
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
