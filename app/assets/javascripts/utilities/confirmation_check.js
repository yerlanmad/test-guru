document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('#user_password')
  var control2 = document.querySelector('#user_password_confirmation')
  
  if (control && control2) {
    control.addEventListener('keyup', confirmation_check)
    control2.addEventListener('keyup', confirmation_check)
  }

})


function confirmation_check() {
  var password = document.querySelector('#user_password').value
  var password_confirmation = document.querySelector('#user_password_confirmation').value


  if (password && password == password_confirmation) {
    document.querySelector('.octicon-check-circle').classList.replace('text-danger', 'text-success')
  } else {
    document.querySelector('.octicon-check-circle').classList.replace('text-success', 'text-danger')
  }
}
