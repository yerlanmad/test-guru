class PasswordConfirmation {
  constructor(form) {
    this.form = form
    this.password = form.elements.user_password
    this.password_confirm = form.elements.user_password_confirmation

    this.setup()
  }

  hideCheckIcon() {
    this.form.querySelector('.octicon-check-circle').classList.add('hide')
  }

  checkPasswords() {
    this.hideCheckIcon()

    if(this.password_confirm.value === this.password.value) {
      this.form.querySelector('.octicon-check-circle').classList.remove('hide')
      this.form.querySelector('.octicon-check-circle').classList.replace('text-danger', 'text-success')
    } else {
      this.form.querySelector('.octicon-check-circle').classList.remove('hide')
      this.form.querySelector('.octicon-check-circle').classList.replace('text-success', 'text-danger')
    }
  }

  setup() {
    this.form.addEventListener('keyup', event => {
      this.hideCheckIcon()
      if(this.password_confirm.value != '') this.checkPasswords()
    })
  }
}
