/*
    register.js
    Lógica específica para la página register.html.
*/

document.addEventListener('DOMContentLoaded', () => {
    const registerForm = document.getElementById('register-form');
    const messageContainer = document.getElementById('message-container');

    if (!registerForm) return;

    registerForm.addEventListener('submit', async (event) => {
        event.preventDefault();

        // Limpia mensajes anteriores
        messageContainer.classList.add('hidden');
        messageContainer.textContent = '';
        // Resetea clases de estilo (para no dejar un mensaje de éxito/error anterior)
        messageContainer.classList.remove('bg-red-900', 'border-red-700', 'text-red-200');
        messageContainer.classList.remove('bg-green-900', 'border-green-700', 'text-green-200');

        // 1. Obtener los datos del formulario.
        const name = document.getElementById('name').value;
        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;

        try {
            // 2. Enviar los datos a la API.
            const response = await fetch('/api/auth/register', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ name, email, password })
            });

            // 3. Procesar la respuesta.
            if (!response.ok) {
                // Si hay un error (ej. 400 - Validación fallida o email ya existe).
                const errorData = await response.json();

                // ASP.NET Validation devuelve un objeto 'errors'
                if (errorData.errors) {
                    // Si hay errores de validación, tomamos el primero y lo mostramos.
                    const firstErrorKey = Object.keys(errorData.errors)[0];
                    const firstErrorMessage = errorData.errors[firstErrorKey][0];
                    throw new Error(firstErrorMessage);
                }

                // Si es otro tipo de error (como el email duplicado).
                throw new Error(errorData.message || 'Error al registrar la cuenta.');
            }

            // 4. Mostrar mensaje de ÉXITO.
            messageContainer.textContent = '¡Cuenta registrada con éxito! Redirigiendo al inicio de sesión...';
            messageContainer.classList.add('bg-green-900', 'border-green-700', 'text-green-200');
            messageContainer.classList.remove('hidden');

            // 5. Redirigir al login después de 2 segundos.
            setTimeout(() => {
                window.location.href = '/login.html';
            }, 2000);

        } catch (error) {
            // 6. Mostrar mensaje de ERROR.
            console.error('Error en el registro:', error);
            messageContainer.textContent = error.message;
            messageContainer.classList.add('bg-red-900', 'border-red-700', 'text-red-200');
            messageContainer.classList.remove('hidden');
        }
    });
});
