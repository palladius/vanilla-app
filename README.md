# 🍦 Vanilla App

My first 🍦 Vanilla App done with skaffold and done WELL.

self: [🇬 go/ricc-vanilla](http://go/ricc-vanilla)

## Apps

* app/ helloworld in node.js with `expressjs` with added Bubble JS functionality.

How to deploy:

* `skaffold run -p wietse [--tail]` Deploy to Cloud Run (with or without logs on your shell). WARNING - everytime I call
  it I noticed that I lose the "open to everyone part" so consider calling the `push-to-cloud-run-via-skaffold.sh` script
  instead which has the logic built in. See b/0001 in `BUGS`
* `./skaffold-dev-wrapper.sh dev` Deploy to DEV cluster, in dev loop
* `./skaffold-prod-wrapper.sh run` Deploy to Prod cluster ONCE (prod namespace, prod ENV vars... as prod as it gets!)

### TODO comic book

Some further ideas:

* Also try this cartoon which is even awesomer: https://codepen.io/alvaromontoro/pen/zYqzgoy
* Also this is amazing: https://codepen.io/chris22smith/pen/MyBBOe (impressive) https://screenshot.googleplex.com/9cvnfhBQNrConp9

## thanks

Thanks to:
* ([@wearehumaan](https://twitter.com/wearehumaan)) (the author of the '[Creating comic book speech bubbles with SVG and javascript](https://www.humaan.com/blog/creating-comic-book-speech-bubbles-with-svg-and-javascript/)' article) for the bubble idea.
* cstanger@ for getting my DOM and Js together.
* [cgrotz](https://github.com/cgrotz/) for inspiring my Cloud run manifests
