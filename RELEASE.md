# Releasing a new version

## 1. Tag the Release

```sh
git tag -a v1.0.0 -m "v1.0.0"
git push origin v1.0.0
```

Create a draft release (generates the tarball)

https://github.com/ericfortis/final-cut-pro-scene-detect/releases/new


## 2. Update Formula with new hash and tarball url
```sh
./update_formula v1.0.0
```


## 3. Update locally
```shell
brew update
brew upgrade fcpscene

brew info fcpscene
fcpscene -v
```