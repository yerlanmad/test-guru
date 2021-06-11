document.addEventListener('turbolinks:load', () => {
  const question = document.querySelector('.question-body')
  if(question) { progressBarHandler(question) }
})

function progressBarHandler(element) {
  let width = element.dataset.index / element.dataset.total * 100
  let progressBar = document.querySelector('.progress-bar')

  progressBar.setAttribute('style', `width: ${width}%`)
}