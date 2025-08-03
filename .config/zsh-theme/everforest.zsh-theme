autoload -Uz colors && colors

truncate_path_with_gradient() {
    local full_path="${PWD/#$HOME/~}"
    local -a path_parts=("${(@s:/:)full_path}")
    local output=""
    local colors=("#2b3b51" "#3d5670" "#4f7b99" "#63a4c5" "#7fc8f8") 
    local max_depth=4

    local len=${#path_parts}
    local visible_parts=()
    local ellipsis=""

    if (( len > max_depth )); then
        ellipsis="%F{#434C5E}../%f"
        visible_parts=("${(@)path_parts[-$max_depth,-1]}")
    else
        visible_parts=("${path_parts[@]}")
    fi

    local color_start_index=$(( ${#colors} - ${#visible_parts} ))
    output="$ellipsis"
    local j=0
    for part in "${visible_parts[@]}"; do
        local color=${colors[$((color_start_index + j))]}
        output+="%F{$color}${part}%f/"
        ((j++))
    done

    echo "${output%/}"
}

# Git Info
git_info() {
    git rev-parse --is-inside-work-tree &>/dev/null || return

    local branch branch_icon merge=""
    if branch=$(git symbolic-ref --short HEAD 2>/dev/null); then
        branch_icon=""
    else
        branch=$(git rev-parse --short HEAD 2>/dev/null)
        branch_icon=""
    fi

    [ -f "$(git rev-parse --git-dir)/MERGE_HEAD" ] && merge=" "
    git diff --quiet --ignore-submodules HEAD 2>/dev/null || local dirty=1

    local ahead behind remote=""
    if git rev-parse --abbrev-ref --symbolic-full-name @{u} &>/dev/null; then
        read ahead behind <<<$(git rev-list --left-right --count HEAD...@{upstream} 2>/dev/null)
        [[ $ahead -gt 0 ]] && remote+=" ↑$ahead"
        [[ $behind -gt 0 ]] && remote+=" ↓$behind"
        [[ -n $remote ]] && remote=" $remote"
    fi

    local insertions=$(git diff --shortstat 2>/dev/null | grep -o '[0-9]* insertion' | cut -d' ' -f1)
    local deletions=$(git diff --shortstat 2>/dev/null | grep -o '[0-9]* deletion' | cut -d' ' -f1)

    local out="%F{yellow}${branch_icon}%f %F{magenta}${branch}%f${merge}"
    [[ $dirty ]] && out+=" %F{red}✗%f" || out+=" %F{green}✔%f"
    [[ -n $remote ]] && out+="$remote"
    [[ $insertions ]] && out+=" %F{green}+${insertions}%f"
    [[ $deletions ]] && out+=" %F{red}-${deletions}%f"

    echo "$out"
}

# Placeholder (optional)
conda_prompt=''          
user_host='%n@%m'       
rvm_ruby=''              
venv_prompt=''          
vcs_branch=''            
return_code='%?'         

# PROMPT 
PROMPT='%F{blue}┌─%f${conda_prompt} $(truncate_path_with_gradient) $(git_info)
%F{blue}└──%f %F{red}$%f '

RPROMPT='%F{red}%(?..✗)%f' 