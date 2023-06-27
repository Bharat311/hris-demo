# Pin npm packages by running ./bin/importmap

pin "application", preload: true

pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.0.5/lib/assets/compiled/rails-ujs.js"
pin "mergedev", to: "https://cdn.merge.dev/initialize.js"
pin "@useparagon/connect", to: "https://ga.jspm.io/npm:@useparagon/connect@1.0.1/dist/src/index.js"

pin "merge"
pin "paragon"
