#!/bin/sh
# Author: str3tch @ Vegas 2.0 | dc702 | PHS
# Description: Converts wireless pcap files to hashcat-friendly files
# Dependencies: Linux, hcx tools set (hcxpcapngtool)

INPUT_DIR=.
OUTPUT_DIR=/tmp/$(date +"%Y%m%d%H%M")
CONVERT_CMD=hcxpcapngtool

# Set directories if provided as arguments
if [ $# -gt 0 ]; then
    INPUT_DIR="$1"
    if [ $# -eq 2 ]; then
        OUTPUT_DIR="$2"
    fi
fi

# Exit if the input directory doesn't exist
if [ ! -d "${INPUT_DIR}" ]; then
    echo "Input/pcap directory does not exist."
    exit 1
fi

# Create the output directory exists, and exit if creation fails
if [ ! -d "${OUTPUT_DIR}" ]; then
    echo "Creating output directory..."
    mkdir -p "${OUTPUT_DIR}" || exit 1
fi

# Search for and process pcap files
echo "Looking for pcap files in ${INPUT_DIR}/\n"
for file in `ls "${INPUT_DIR}"/*.pcap`; do
    output_prefix="${OUTPUT_DIR}/$(basename \"${file}\" | cut -d '.' -f 1)"
    echo "Input: ${file}"
    echo "Output: {output_prefix}.*"
    ${CONVERT_CMD} -o "${output_prefix}.22000" -E "${output_prefix}.essid" -I "${output_prefix}.info" "$file" > "${output_prefix}.log"
    echo "Log: ${output_prefix}.log"
    echo ""
done
