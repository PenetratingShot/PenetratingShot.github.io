add() {
    git add .
    printf "Enter your commit message: "
    read message
    git commit -m "$message"
    
    if [[ -z "$message" ]]; then
        printf "\e[31mError: you must enter a commit message\e[39m\n"
        add
    fi
}

git add .
printf "Enter your commit message: "
read message
git commit -m "$message"

if [[ -z "$message" ]]; then
    echo "\e[31mError: you must enter a commit message\e[39m\n"
    add
fi

printf "Source: "
read source

#user doesn't specify remote
if [[ -z "$source" ]]; then
    #promt user for branch
    printf "Branch: "
    read branch
    #user doesn't specify branch
    if [[ -z "$branch" ]]; then
        #pushing to default settings
        git push origin master
    else
        printf "git push origin $branch"
    fi
#source
else
   printf "Branch: "
   read branch2
   #user dosen't input branch but has inputted a remote
   if [[ -z "$branch2" ]]; then
        printf "git push $source master"
   else
        printf "git push $source $branch2"
   fi
fi
 