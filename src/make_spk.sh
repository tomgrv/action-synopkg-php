#!/bin/sh

local spk_tmp_dir=$1
local spk_dest_dir=$2
local app_dir=$3
local www_dir=$4
local pkg_size=$(cat ${spk_tmp_dir}/extractsize_tmp)

echo ">>> Making spk: ${spk_filename}"
mkdir -p "${spk_dest_dir}"
rm "${spk_tmp_dir}/extractsize_tmp"

# copy scripts and icon
cp -ra "${app_dir}/.synopkg/scripts" "$spk_tmp_dir"
cp -a  "${app_dir}/.synopkg/PACKAGE_ICON*.PNG" "$spk_tmp_dir"

# Generate INFO file
./src/INFO.sh "${app_dir}/composer.json" "${pkg_size}" > "${spk_tmp_dir}"/INFO

tar -cf "${spk_dest_dir}/${spk_filename}" -C "${spk_tmp_dir}" $(ls ${spk_tmp_dir})
