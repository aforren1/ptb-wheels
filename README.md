Using https://github.com/pypa/python-manylinux-demo as reference.

And https://stackoverflow.com/questions/12343452/how-to-publish-artifacts-in-travis-ci/33109519#33109519 for deployment tips.

For a new release:

```
git submodule update --recursive --remote
git add --all
git commit -m <message>
git tag -m <version> <version>
git push --tags
```

I *think* it's possible to install packages directly from Github releases, e.g.

```
pip install -f https://github.com/aforren1/ptb-wheels/releases psychtoolbox
```

