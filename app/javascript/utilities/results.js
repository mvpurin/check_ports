document.addEventListener('turbo:load', function() {
  $('form.scan-form').on('ajax:success', function(e, data) {
    let div = document.getElementById('scan-results')
    div.innerHTML = ''
    div.append(JSON.stringify(data.ports))
  })
})