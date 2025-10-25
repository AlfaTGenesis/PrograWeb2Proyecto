document.addEventListener('DOMContentLoaded', () => {

    const loginForm = document.getElementById('login-form');

    const errorMessageContainer = document.getElementById('error-message');


    if (!loginForm) return;

    loginForm.addEventListener('submit', async (event) => {
        event.preventDefault();

        errorMessageContainer.classList.add('hidden');
        errorMessageContainer.textContent = '';

        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;

        try {

            const response = await fetch('/api/auth/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ email: email, password: password })
            });


            if (!response.ok) {
                const errorData = await response.json(); 
                throw new Error(errorData.message || 'Error al iniciar sesión.');
            }


            const data = await response.json();


            saveToken(data.token);

            window.location.href = '/';

        } catch (error) {
            console.error('Error en el login:', error);
            errorMessageContainer.textContent = error.message;
            errorMessageContainer.classList.remove('hidden');
        }
    });
});
