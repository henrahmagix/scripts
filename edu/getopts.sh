#!/bin/bash
 
while getopts ":a-:" optchar; do
    case "${optchar}" in
        -)
            case "${OPTARG}" in
                foo)
                    val="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
                    echo "Parsing option: '--${OPTARG}', value: '${val}'" >&2;
                    ;;
                foo=*)
                    val=${OPTARG#*=}
                    opt=${OPTARG%=$val}
                    echo "Parsing option: '--${opt}', value: '${val}'" >&2
                    ;;
                *)
                    if [ "$OPTERR" = 1 ] && [ "${optspec:0:1}" != ":" ]; then
                        echo "Unknown option --${OPTARG}" >&2
                    fi
                    ;;
            esac
            ;;
        a)
            echo "-a was triggered!" >&2
            ;;
        -foo)
            echo "--foo was triggered!" >&2
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            ;;
    esac
done
