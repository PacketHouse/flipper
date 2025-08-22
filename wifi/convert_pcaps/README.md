# convert_pcaps.sh

## Description
Converts wireless pcap captures (e.g. from Maurauder sniffing) to files that can be used with hashcat.

## Getting Started
```
./convert_pcaps.sh [pcap directory (default: ".")] [output directory (default: <current time>/)]
```
* If no arguments are passed, the default directory to look for pcaps will be the current directory.
* If no output directory is specified, the default output directory will be $(date +"%Y%m%d%H%M") (e.g. 202508212200).
* If the output directory does not exist, it will be created.

### Example usage
```
$ ./convert_pcaps.sh /home/flipper/marauder_pcaps
Looking for pcap files in /home/flipper/marauder_pcaps/

Input: /home/flipper/marauder_pcaps/test.pcap
Output: /tmp/202508212200/test.*
Log: /tmp/202508212200/test.log
```

## Acknowledgments
* [ZeroBeat hcxtools](https://github.com/ZerBea/hcxtools)
