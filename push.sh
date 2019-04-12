git add .
echo "Enter your commit message: "
read message
git commit -m "$message"
echo "Source: "
read source

#user doesn't specify remote
if [[ -z "$source" ]]; then
    #promt user for branch
    echo "Branch: "
    read branch
    #user doesn't specify branch
    if [[ -z "$branch" ]]; then
        #pushing to default settings
        git push origin master
    else
        git push origin $branch
    fi
#source
else
   echo "Branch: "
   read branch2
   #user dosen't input branch but has inputted a remote
   if [[ -z "$branch2" ]]; then
        git push $source master
   else
        git push $source $branch2
   fi
fi
