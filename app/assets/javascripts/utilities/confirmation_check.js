document.addEventListener('turbolinks:load', () => {
  const reg_form = document.getElementById('new_user')
  if(reg_form) new PasswordConfirmation(reg_form)
})
