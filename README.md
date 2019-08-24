Using https://github.com/pypa/python-manylinux-demo as reference.

And https://stackoverflow.com/questions/12343452/how-to-publish-artifacts-in-travis-ci/33109519#33109519 for deployment tips.

For a new release:

1. Update submodule via `git submodule update --recursive --remote`
2. Tag a new release & push:

```
git commit -m <version>
git tag -m <version> <version>
git push --tags
```
