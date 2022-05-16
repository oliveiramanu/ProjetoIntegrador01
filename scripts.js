
if (!!document.getElementById("passToggle")) passToggle.onclick = togglePassword;
if (!!document.getElementById("newPassToggle")) newPassToggle.onclick = togglePassword;

function togglePassword() {

    idField = this.getAttribute('data-field');

    if (document.getElementById(idField).type == 'password') {

        document.getElementById(idField).type = 'text';

        this.innerHTML = '<i class="fa-solid fa-eye-slash fa-fw"></i>';

    } else {

        document.getElementById(idField).type = 'password';

        this.innerHTML = '<i class="fa-solid fa-eye fa-fw"></i>';

    }

    return false;
}