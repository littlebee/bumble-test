## [0.4.1](https://github.com/littlebee/bumble-test.git/compare/0.4.0...0.4.1) (2017-02-18)


### Other Commits
* [30f7bf6](https://github.com/littlebee/bumble-test.git/commit/30f7bf6a6242801f6fc01ed163d9481e8fea2ab9) use withCompiled branch of coffee-coverage fork

## [0.4.0](https://github.com/littlebee/bumble-test.git/compare/0.3.1...0.4.0) (2017-02-18)


### New Features
* [5db9ed3](https://github.com/littlebee/bumble-test.git/commit/5db9ed3c0681567969b8d9c70dcd13df021e3b57)  add support for code coverage on .cjsx files. Temporarily using custom fork of coffee-coverage awaiting pull request

## [0.3.1](https://github.com/littlebee/bumble-test.git/compare/0.3.0...0.3.1) (2017-02-7)


### Other Commits
* [be5674e](https://github.com/littlebee/bumble-test.git/commit/be5674e516f2de632838f3077623dc46d084e5e4) more tweaks to instanbul register - code overage really works

## [0.3.0](https://github.com/littlebee/bumble-test.git/compare/0.2.2...0.3.0) (2017-02-7)
code coverage works!  use `node_modules/.bin/istanbul report text-summary lcov` to generate after running tests and view coverage/lcov-report/index.html

### Other Commits
* [7f3512d](https://github.com/littlebee/bumble-test.git/commit/7f3512dc27b4bdb4f5c933efbaa4e3e795e323b7) add initAll:true to instanbul register - code overage works!  use 'node_modules/.bin/istanbul report text-summary lcov'

## [0.2.2](https://github.com/littlebee/bumble-test.git/compare/0.2.1...0.2.2) (2017-02-7)


### Other Commits
* [3bc1cc2](https://github.com/littlebee/bumble-test.git/commit/3bc1cc2d7bbf12226e3a175e2edd252d2dd92bd0) testRunner should exit with failure count

## [0.2.1](https://github.com/littlebee/bumble-test.git/compare/0.2.0...0.2.1) (2017-02-6)


### Other Commits
* [298bb36](https://github.com/littlebee/bumble-test.git/commit/298bb36b21e7215455432e3288831e8c5efafdd0) should set helper scripts as executable after copying

## [0.2.0](https://github.com/littlebee/bumble-test.git/compare/0.0.0...0.2.0) (2017-02-6)
Added helper scripts scripts/runTest and scripts/debugTest to expedite development of tests.
