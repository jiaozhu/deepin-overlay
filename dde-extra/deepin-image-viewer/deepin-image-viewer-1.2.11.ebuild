# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit qmake-utils

DESCRIPTION="Deepin Image Viewer"
HOMEPAGE="https://github.com/linuxdeepin/deepin-image-viewer"
SRC_URI="https://github.com/linuxdeepin/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-qt/qtsvg:5
		dev-qt/qtconcurrent:5
		dev-qt/qtgui:5
		dev-qt/qtdbus:5
		dev-qt/qtx11extras:5
		media-libs/libraw
		media-libs/libexif
		media-libs/freeimage
		"

DEPEND="${RDEPEND}
		>=dde-base/deepin-tool-kit-0.2.4:=
	    "

src_prepare() {
#	sed -i 's|-0-2||g' viewer/viewer.pro
	eqmake5
}

src_install() {
	emake INSTALL_ROOT=${D} install
}