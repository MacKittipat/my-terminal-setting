RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)

git_branch() {
    # Exit function if current folder does not have .git folder
    #if [[ $(git rev-parse --git-dir > /dev/null 2>&1) != ".git" ]]
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
    #then
        return 0
    fi
    # Determine color status
    local branch_color=$MAGENTA
    if [[ $(git status --porcelain) != "" ]]
    then
        # There is change in git repo
        branch_color=$YELLOW
    fi
    # Print git branch with color
    echo "$branch_color$(git rev-parse --abbrev-ref HEAD)"
	#echo "$branch_color$(git symbolic-ref --short -q HEAD)"
}

#http://shreyaschand.com/blog/2013/03/18/show-git-branch-status-in-bash-prompt/
#http://superuser.com/questions/351067/terminal-line-wrapping`
export PS1='\[\e]0;\w\a\]\u@\h:\[$GREEN\]\w\[$WHITE\]:$(git_branch)\[$(tput sgr0)\]->'
#export PS1='\[\e]0;\w\a\]\u@\h:\[$GREEN\]\w\[$WHITE\]:$(git_branch)\[$(tput sgr0)\]->'

