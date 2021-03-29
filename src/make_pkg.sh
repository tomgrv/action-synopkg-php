#!/bin/sh

local tmp_dir=$1
local dest_dir=$2
local app_dir=$3
local dest_pkg="$dest_dir/package.tgz"

echo ">>> Making inner package.tgz"
mkdir -p ${tmp_dir}/bin
cp -a ${app_dir} ${tmp_dir}

pkg_size=$(du -sk "${tmp_dir}" | awk '{print $1}')
echo "${pkg_size}" >> "$dest_dir/extractsize_tmp"

ls --color=no $tmp_dir | tar -cJf $dest_pkg -C "$tmp_dir" -T /dev/stdin
