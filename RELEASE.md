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


---

### Local testing

```sh
cd ~/work
tar -czvf final-cut-pro-scene-detect-1.0.0.tar.gz final-cut-pro-scene-detect/

shasum -a 256 ~/work/final-cut-pro-scene-detect-1.0.0.tar.gz

# Edit the formula with: 
#   url "file://<path-here>.tar.gz"
#   sha256 "<hash-here>"
#   version "1.0.0"

brew uninstall fcpscene
brew install --debug ~/work/homebrew-fcpscene/Formula/fcpscene.rb
```
