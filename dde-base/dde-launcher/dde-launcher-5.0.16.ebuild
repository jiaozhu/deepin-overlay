# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake-utils

DESCRIPTION="Deepin desktop environment - Launcher module"
HOMEPAGE="https://github.com/linuxdeepin/dde-launcher"
SRC_URI="https://community-packages.deepin.com/deepin/pool/main/d/${PN}/${PN}_${PV}+c1.orig.tar.xz -> ${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-qt/qtsvg:5
		 dev-qt/qtx11extras:5
		 >=dde-base/deepin-menu-5.0.1
		 dde-base/dde-daemon
		 x11-misc/xdg-user-dirs
		 >=dde-base/deepin-desktop-schemas-5.4.9
		 x11-libs/gsettings-qt
	     "
DEPEND="${RDEPEND}
		x11-libs/xcb-util-wm
		x11-libs/libxcb
		>=dde-base/dtkwidget-2.0.0:=
		dde-base/dde-qt-dbus-factory:=
		"

S="${WORKDIR}/${P}+c1"

src_configure() {
	local mycmakeargs=(
			-DCMAKE_INSTALL_PREFIX=/usr 
			-DWITHOUT_UNINSTALL_APP=1
	)
	cmake-utils_src_configure
}
