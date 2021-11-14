#!/usr/bin/env bash
#
# Rofi script for searching the web.
#
# Requirements:
# - rofi (https://github.com/DaveDavenport/rofi)

set -u
set -e

declare -A SITES

# Set default variable value to empty string.
SITE_TO_USE=""

CACHE_DIR="$HOME/.cache/stevenliebregt/rofi-scripts/web-search"
BROWSER="firefox"

SITES=(
    ["google"]="https://www.google.com/search?q="
    ["stackoverflow"]="https://www.stackoverflow.com/search?q="
    ["stackexchange"]="https://stackexchange.com/search?q="
    ["superuser"]="https://superuser.com/search?q="
    ["tex"]="https://tex.stackexchange.com/search?q="
    ["softwareengineering"]="https://softwareengineering.stackexchange.com/search?q="
    ["github"]="https://www.github.com/search?q="
    ["youtube"]="https://www.youtube.com/results?search_query="
    ["superuser"]="https://www.superuser.com/search?q="
    ["amazon"]="https://www.amazon.de/s?k="
    ["maps"]="https://www.google.com/maps/search/"
    ["ebay"]="https://www.ebay.de/sch/i.html?_nkw="
    ["reddit"]="https://www.reddit.com/search?q="
    ["duckduckgo"]="https://duckduckgo.com/?q="
    ["devdocs"]="https://devdocs.io/#q="
)

# Show usage for the script.
usage()
{
    echo "web-search is a script that opens a rofi browser with which you can"
    echo "search the web."
    echo ""
    echo "Usage: $0 [-s <site to search>] [-b <browser executable> ]"
    echo "  -h      show this help"
    echo "  -s      give the search engine to use, can be one of the following:"

    for site in "${!SITES[@]}"; do
        echo "              * $site"
    done

    echo "  -b      give the browser to use, the default value is 'firefox'"

    exit 1
}

# Creates the cache directory if it does not exist.
create_cache_dir() {
    if [ ! -d "$CACHE_DIR" ]; then
        mkdir -p "$CACHE_DIR"
    fi
}

# Create the cache files if they do not exist.
create_cache_files() {
    for site in "${!SITES[@]}"
    do
        if [ ! -f "$CACHE_DIR/$site.txt" ]; then
            touch "$CACHE_DIR/$site.txt"
        fi
    done
}

# Generate the list of sites.
#
# If a config file exists, use the sites from that list, otherwise populate
# the list with the sites from the $SITES variable.
gen_sites_list()
{
    for site in "${!SITES[@]}"
    do
        echo "$site"
    done
}

# Generate the list of previously used search queries.
gen_queries_list()
{
    site=$1

    cat "$CACHE_DIR/$site.txt"
}

# Write a given line to a given file to the top of the file.
#
# It does this by creating a temporary file and then catting that output to the
# file after echoing the new line.
#
# Expects 2 arguments:
#  - The name of the file to write to, must be one of the options of sites in
#    the SITES array.
#  - The new line to input at the top of the new file.
write_to_top()
{
    file=$1
    content=$2

    # Move old values to temporary file.
    cat "$CACHE_DIR/$file.txt" > "$CACHE_DIR/tmp.txt"
    # Print query to top.
    echo "$content" > "$CACHE_DIR/$file.txt"
    cat "$CACHE_DIR/tmp.txt" >> "$CACHE_DIR/$file.txt"
    # Remove temporary file.
    rm "$CACHE_DIR/tmp.txt"

}

# Handle the query.
handle_query()
{
    site=$1
    query=$2

    # Write the query to file.
    # Check if the search query already exists.
    if grep -Fxq "$query" "$CACHE_DIR/$site.txt"; then
        # Remove the existing entry.
        echo "$(cat "$CACHE_DIR/$site.txt" | grep -xv "$query")" > "$CACHE_DIR/$site.txt"
        # Write the new entry on top.
        write_to_top "$site" "$query"
    else
        # Write the new entry on top.
        write_to_top "$site" "$query"
    fi

    # google-chrome-stable "${SITES[$site]}$query"
    $BROWSER "${SITES[$site]}$query"
}

main()
{
    create_cache_dir
    create_cache_files

    if [ "$@" ]
    then
        handle_query "google" "$@"
    else
        # Check if search engine set.
        if [ "$SITE_TO_USE" ]; then
            query=$(echo "$(gen_queries_list $SITE_TO_USE)" | rofi -dmenu -p "Search ($SITE_TO_USE)")

            handle_query "$SITE_TO_USE" "$query"
        else
            site=$(echo "$(gen_sites_list)" | rofi -dmenu -p "Search" -no-custom)
            query=$(echo "$(gen_queries_list $site)" | rofi -dmenu -p "Search ($site)")

            handle_query "$site" "$query"
        fi
    fi
}

# Get argument options.
while getopts ":s:b:" o; do
    case "${o}" in
        s)
            SITE_TO_USE=${OPTARG}
            ;;
        b)
            BROWSER=${OPTARG}
            ;;
        \?)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

main "$@"
