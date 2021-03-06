![Build](https://github.com/aforren1/ptb-wheels/workflows/Build/badge.svg)

The most recent wheels can be found under https://github.com/aforren1/ptb-wheels/actions (click the most recent workflow and find under "Artifacts").

Uses [cibuildwheel](https://github.com/joerick/cibuildwheel/) + GitHub Actions to generate wheels.

---

To init the subtree, used

```
git subtree add --prefix psychtoolbox-3 https://github.com/psychtoolbox-3/psychtoolbox-3.git 3.0.17.7 --squash
```

And to update, use

```
git subtree pull --prefix psychtoolbox-3 https://github.com/psychtoolbox-3/psychtoolbox-3.git <version> --squash
```

(and update psychtoolbox-3/PsychPython/psychtoolbox/\_version.py)
