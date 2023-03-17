
Switch from main to fork:

1. `git submodule set-url -- psychtoolbox-3 https://github.com/aforren1/psychtoolbox-3`
2. `git submodule set-branch --branch <branch> psychtoolbox-3`
3. `git submodule sync`?
4. `cd psychtoolbox-3`, pull & make sure right branch/commit available?

Fork to main:

1. `git submodule set-url -- psychtoolbox-3 https://github.com/kleinerm/psychtoolbox-3`
2. `git submodule set-branch --branch master psychtoolbox-3`
3. `git submodule sync`?
4. Check out master, pull latest?
