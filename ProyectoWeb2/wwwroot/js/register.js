document.addEventListener('DOMContentLoaded', () => {
    const registerForm = document.getElementById('register-form');
    const messageContainer = document.getElementById('message-container');

    if (!registerForm) return;

    registerForm.addEventListener('submit', async (event) => {
        event.preventDefault();

        messageContainer.classList.add('hidden');
        messageContainer.textContent = '';
        messageContainer.classList.remove('bg-red-900', 'border-red-700', 'text-red-200');
        messageContainer.classList.remove('bg-green-900', 'border-green-700', 'text-green-200');

        const name = document.getElementById('name').value;
        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;

        try {
            const response = await fetch('/api/auth/register', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ name, email, password })
            });

            if (!response.ok) {
                const errorData = await response.json();

                if (errorData.errors) {
                    const firstErrorKey = Object.keys(errorData.errors)[0];
                    const firstErrorMessage = errorData.errors[firstErrorKey][0];
                    throw new Error(firstErrorMessage);
                }

                throw new Error(errorData.message || 'Error al registrar la cuenta.');
            }

            messageContainer.textContent = '¡Cuenta registrada con éxito! Redirigiendo al inicio de sesión...';
            messageContainer.classList.add('bg-green-900', 'border-green-700', 'text-green-200');
            messageContainer.classList.remove('hidden');

            setTimeout(() => {
                window.location.href = '/login.html';
            }, 2000);

        } catch (error) {
            console.error('Error en el registro:', error);
            messageContainer.textContent = error.message;
            messageContainer.classList.add('bg-red-900', 'border-red-700', 'text-red-200');
            messageContainer.classList.remove('hidden');
        }
    });
});
