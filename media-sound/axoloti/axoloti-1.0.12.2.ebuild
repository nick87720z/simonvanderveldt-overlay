# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit versionator eutils unpacker xdg-utils gnome2-utils

MY_PV=$(replace_version_separator 3 '-')

DESCRIPTION="Workbench to compose and edit sound algorithms and interactions for Axoloti Core"
HOMEPAGE="http://www.axoloti.com"
SRC_URI="https://github.com/axoloti/axoloti/releases/download/${MY_PV}/${PN}-linux-${MY_PV}.deb"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
"

QA_PREBUILT=""
QA_PRESTRIPPED=""

S=${WORKDIR}

src_install() {
	AXOLOTI_HOME="/opt/Axoloti"
	dodir ${AXOLOTI_HOME}
	insinto ${AXOLOTI_HOME}
	doins -r opt/Axoloti/*
	fperms +x ${AXOLOTI_HOME}/Axoloti
	# dosym ${AXOLOTI_HOME}/Axoloti /usr/bin/axoloti

	# doicon -s scalable usr/share/icons/hicolor/scalable/apps/bitwig-studio.svg
	# sed -i \
	# -e 's/Icon=.*/Icon=bitwig-studio/' \
	# -e 's/Categories=.*/Categories=AudioVideo;Audio;AudioVideoEditing/' \
	# usr/share/applications/bitwig-studio.desktop || die 'sed on desktop file failed'
	# domenu usr/share/applications/bitwig-studio.desktop
	# doicon -s scalable -c mimetypes usr/share/icons/hicolor/scalable/mimetypes/*.svg
	# insinto /usr/share/mime/packages
	# doins usr/share/mime/packages/bitwig-studio.xml
}

pkg_postinst() {
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
	gnome2_icon_cache_update
}
