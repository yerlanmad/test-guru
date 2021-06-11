document.addEventListener('turbolinks:load', () => {
  const question = document.querySelector('.question-body')
  if(question) progressBarHandler(question)
})

function progressBarHandler(element) {
  const width = element.dataset.index / element.dataset.total * 100
  const progressBar = document.querySelector('.progress-bar')

  progressBar.setAttribute('style', `width: ${width}%`)
}