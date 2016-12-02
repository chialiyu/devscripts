##Git
git reset --hard origin/master
git fetch --all
# fetch and merge with local branch
git pull origin master

# get git master branch then create a new branch from it
git checkout master
git pull origin master
git checkout -b <newbranchname>

### Get a tag
git clone
#After the clone, you can list the tags with $ git tag -l and then checkout a specific tag:
git checkout tags/<tag_name>
#Even better, checkout and create a branch (otherwise you will be on a branch named after the revision number of tag):
git checkout tags/<tag_name> -b <branch_name>

## Revert to an earlier commit
git rest --hard <commithash>


# Revert commit if done on wrong branch
git reset --soft HEAD^
git checkout -b <Branch you want>

# Get latest of a file
git checkout origin/master <deploy/runSparkJob.python>

## Merge master with local branch - test it out
git checkout <dev branch>
git fetch origin
git merge origin/master

#git commit and push
git add .
git status
git checkout -b "branchname"
git push origin "branchname"
#undo git add
git reset

#git revert (undo a commit)
git revert <commit hash>
git log

# git add upstream - forked repo
git remote add upstream <git@git.target.com:esv-cookbooks/tgt-apache_spark.git>
git merge upstream/master
git pull upstream

#rebase
git rebase -i HEAD<~14  number of commit>
#edit your commit.  remove pick.  add s
#wq
git log
git push -f origin <your branch>

# Clean up merged branches
git branch -d `git branch --merged`
git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
# Clean up all branches
git branch | grep -v "\*" | xargs -n 1 git branch -D

# Clean working folder
git clean -d -i

## Stash (a branch)
git stash
git stash save <message>
#list all stashes
git stash list
#Apply stash
git stash apply <stash@{2}>
git stash pop
#Create a branch from stash
git stash branch <branchname>

## Create a branch using git hash
git branch branchname <sha1-of-commit>
git branch -a #show all branches
git branch -r #show remote branches
git branch #show local branches



## Merge back with master
git checkout master
git merge --no-ff ext-parameter
git push origin master

## List all remote git URL
git remote -v

## delete local branch'
git branch -d <the_local_branch>

## diff tool
gitk

##### Display trees
# Add the following to global git config
# [alias]
#    tree = log --graph --decorate --pretty=oneline --abbrev-commit
# or
# git config --global alias.tree "log --graph --decorate --pretty=oneline --abbrev-commit"
git tree
