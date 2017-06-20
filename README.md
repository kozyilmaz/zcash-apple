# Tools

### add subtree to project
```
$ git remote add tools https://github.com/kozyilmaz/tools.git
$ git subtree add --prefix=tools/ --squash tools master
```

### check subtree after clean clone
```
$ git fetch https://github.com/kozyilmaz/tools.git master
$ ./contrib/devtools/git-subtree-check.sh tools
```

### sync subtree repositories
```
$ git remote add tools-remote https://github.com/kozyilmaz/tools.git
$ git subtree pull --prefix=tools/ --squash tools-remote master
```

### two ways of checking subtrees
```
$ git log | grep git-subtree-dir | tr -d ' ' | cut -d ":" -f2 | sort | uniq
$ git log | grep git-subtree-dir | tr -d ' ' | cut -d ":" -f2 | sort | uniq | xargs -I {} bash -c 'if [ -d $(git rev-parse --show-toplevel)/{} ] ; then echo {}; fi'
```

### working with forks
```
$ git clone LOCAL_REPO
$ git remote add upstream FORKED_REPO
$ git fetch upstream
$ git merge upstream/master
```

### working with branches
```
$ git branch newbranch
$ git checkout newbranch
$ git push -u origin newbranch
```
