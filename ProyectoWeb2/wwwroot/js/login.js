/*
    login.js
    Lógica específica para la página login.html.
*/

// Espera a que el DOM esté completamente cargado.
document.addEventListener('DOMContentLoaded', () => {
    // Busca el formulario de login.
    const loginForm = document.getElementById('login-form');
    // Busca el contenedor de mensajes de error.
    const errorMessageContainer = document.getElementById('error-message');

    // Si no encuentra el formulario, no hace nada más.
    if (!loginForm) return;

    // Añade un "escuchador" para el evento 'submit' (cuando el usuario hace clic en el botón).
    loginForm.addEventListener('submit', async (event) => {
        // Previene que el formulario se envíe de la forma tradicional (recargando la página).
        event.preventDefault();

        // Oculta cualquier mensaje de error anterior.
        errorMessageContainer.classList.add('hidden');
        errorMessageContainer.textContent = '';

        // 1. Obtener los datos del formulario.
        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;

        try {
            // 2. Enviar los datos a la API.
            // (Usamos 'fetch' normal porque aún no estamos autenticados).
            const response = await fetch('/api/auth/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                // Convierte los datos de JS a una cadena JSON.
                body: JSON.stringify({ email: email, password: password })
            });

            // 3. Procesar la respuesta de la API.

            if (!response.ok) {
                // Si la respuesta no es 200 (OK), significa que hubo un error (ej. 401 - Unauthorized).
                const errorData = await response.json(); // El backend envía un { message: "..." }
                throw new Error(errorData.message || 'Error al iniciar sesión.');
            }

            // Si la respuesta es 200 (OK):
            // Convertimos la respuesta (que contiene el token) a un objeto JS.
            const data = await response.json();

            // 4. Guardar el token.
            // Usamos la función 'saveToken' que está definida en 'main.js'.
            saveToken(data.token);

            // 5. Redirigir al usuario a la página de inicio.
            // El usuario ahora está autenticado.
            window.location.href = '/';

        } catch (error) {
            // 6. Mostrar cualquier error en el contenedor de errores.
            console.error('Error en el login:', error);
            errorMessageContainer.textContent = error.message;
            errorMessageContainer.classList.remove('hidden');
        }
    });
});
