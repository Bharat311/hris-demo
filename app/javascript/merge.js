function openMergeLink(token, callback) {
  MergeLink.initialize({
    linkToken: token,
    shouldSendTokenOnSuccessfulLink: true,
    onReady: () => (MergeLink.openLink()),
    onSuccess: (token) => callback(token)
  });
}

window.addEventListener('load', function() {
  var elements = document.getElementsByClassName('merge-link');

  for (let index = 0; index < elements.length; index++) {
    const element = elements[index];

    element.addEventListener('ajax:success', function(event) {
      var token = event.detail[0].link_token;

      console.log('Private token: ', token)

      openMergeLink(token, function(public_token) {
        console.log('Public token: ', public_token)
      })
    });
  }
})
