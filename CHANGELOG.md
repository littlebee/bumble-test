## [0.6.0](https://github.com/littlebee/bumble-test.git/compare/v0.5.0...v0.6.0) - (2018-06-14)

### Other Commits
* [27b7a71](https://github.com/littlebee/bumble-test.git/commit/27b7a716103531fae806f488d7f21a195203f61a) update jsdom to jsdom-global for modern event support

## [0.5.0](https://github.com/littlebee/bumble-test.git/compare/v0.4.3...v0.5.0) - (2018-06-11)

### Other Commits
* [a103f0c](https://github.com/littlebee/bumble-test.git/commit/a103f0c480fcad81c71da499f2b67bf615eb7ddf) update mocha to 4.1.0 to fix growl < v1.10 security nanny alert

## [0.4.3](https://github.com/littlebee/bumble-test.git/compare/0.4.2...0.4.3) (2018-04-10)


### Other Commits
* [281e3b6](https://github.com/littlebee/bumble-test.git/commit/281e3b62da931310df070ae84ba8e631aaaa8ef5) add shim for global.requestAnimationFrame as needed by React 16

## [0.4.2](https://github.com/littlebee/bumble-test.git/compare/0.4.1...0.4.2) (2018-04-4)


### Other Commits
* [b631f53](https://github.com/littlebee/bumble-test.git/commit/b631f53ef6089a7faec086d599911a4abf38d28c) update coffee-react to 5.0.0

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
