# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.7.0/dist/jquery.js"
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.0.5/lib/assets/compiled/rails-ujs.js"

pin "merge"
