git_info() {
    local project_root=$(git rev-parse --show-toplevel 2> /dev/null)
    if [[ -z $project_root ]]; then
        return
    fi
    local current_branch=$(git branch --show-current)
    git diff-index --quiet HEAD -- 2> /dev/null || uncommitted_changes=true

    local branch_color
    if [[ "$current_branch" == "master" || "$current_branch" == "main" ]]; then
        branch_color="\e[38;2;241;250;140m"  # yellow
    else
        branch_color="\e[38;2;139;233;253m" # Cyan 
    fi

    local styled_branch_name="::${branch_color}$current_branch\e[0m"

    if [[ ! $uncommitted_changes ]]; then
        printf $styled_branch_name
        return
    fi

    local stats=$(git diff --stat)
    if [[ -z $stats ]]; then
        printf $styled_branch_name
        return
    fi

    local insertions=$(echo "$stats" | grep -o '[0-9]* insertion' | cut -d' ' -f1)
    local deletions=$(echo "$stats" | grep -o '[0-9]* deletion' | cut -d' ' -f1)

    if [[ ! -z $insertions && ! -z $deletions ]]; then
        printf "$styled_branch_name::<\e[38;2;80;250;123m+\e[0m$insertions|\e[38;2;255;85;85m-\e[0m$deletions>"
    elif [[ ! -z $insertions && -z $deletions ]]; then
        printf "$styled_branch_name::<\e[38;2;80;250;123m+\e[0m$insertions>"
    elif [[ -z $insertions && ! -z $deletions ]]; then
        printf "$styled_branch_name::<\e[38;2;255;85;85m-\e[0m$deletions>"
    else
        printf "$styled_branch_name"
    fi
}

get_cwd() {
    local current_dir=$(pwd)
    if [[ "$current_dir" == "$HOME" ]]; then
        echo "󰫵󰫼󰫺󰫲"
    else
        echo "$(basename "$current_dir")"
    fi
}

# symbols ┌─ and └  in blue
left="%{\e[38;2;37;172;250m%}┌─%{\e[0m%}"
bottom="\n%{\e[38;2;37;172;250m%}└%{\e[0m%} %{\e[38;2;255;85;85m%}$%{\e[0m%}" # $ in red

#Dracula Pink
export PS1=$'$(print $left) %{\e[38;2;255;121;198m%}$(get_cwd)%{\e[0m%}$(git_info) $(print $bottom) '
