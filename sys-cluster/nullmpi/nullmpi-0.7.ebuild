# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools-utils

DESCRIPTION="MPI substitute library"
HOMEPAGE="http://wissrech.ins.uni-bonn.de/research/projects/nullmpi/"
SRC_URI="http://wissrech.ins.uni-bonn.de/research/projects/nullmpi/${PF}.tar.gz"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="static-libs"

RDEPEND="!sys-cluster/mpich
	!sys-cluster/lam-mpi
	!sys-cluster/mpich2
	!sys-cluster/mpiexec"

DEPEND="${RDEPEND}"

DOCS=( AUTHORS ChangeLog README TODO )

PATCHES=( "${FILESDIR}/${P}-libtool.patch" )

src_prepare() {
	autotools-utils_src_prepare
	eautoreconf || die "eautoreconf failed"
}
