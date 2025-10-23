
const API_BASE_URL = 'http://localhost:8000/api';


/**
 * Guarda el token JWT en el almacenamiento local del navegador.
 * @param {string} token
 */
function saveToken(token) {
    localStorage.setItem('jwtToken', token);
}

/**
 * Obtiene el token JWT del almacenamiento local.
 * @returns {string|null} 
 */
function getToken() {
    return localStorage.getItem('jwtToken');
}

/**
 * Elimina el token JWT del almacenamiento local (cierre de sesión).
 */
function removeToken() {
    localStorage.removeItem('jwtToken');
}

/**
 * Comprueba si el usuario está actualmente logueado (si existe un token).
 * @returns {boolean} 
 */
function isUserLoggedIn() {
    return getToken() !== null;
}


function logout() {
    removeToken();

    window.location.href = '/index.html';
}

/**
 * @param {string} endpoint - El endpoint de la API al que llamar (ej. "/Stadiums").
 * @param {object} options - Opciones estándar de fetch (method, headers, body, etc.).
 * @returns {Promise<Response>} 
 */
async function fetchWithAuth(endpoint, options = {}) {

    const token = getToken();


    const headers = { ...options.headers };


    if (token) {
        headers['Authorization'] = `Bearer ${token}`;
    }


    if (!headers['Content-Type'] && options.body) {
        headers['Content-Type'] = 'application/json';
    }
    if (!headers['Accept']) {
        headers['Accept'] = 'application/json';
    }


    const url = `${API_BASE_URL}${endpoint}`;

    const fetchOptions = {
        ...options,
        headers: headers
    };

    const response = await fetch(url, fetchOptions);


    if (response.status === 401) {
        console.error('Error de autorización. Token inválido o expirado.');
        logout();
        throw new Error('No autorizado');
    }

    return response;
}

function renderNavbar() {
    const navbarContainer = document.querySelector('#navbar-container');
    if (!navbarContainer) {
        console.error('No se encontró el #navbar-container en la página.');
        return;
    }

    const loggedIn = isUserLoggedIn();
    let navHTML = '';

    if (loggedIn) {
        // --- Navbar para usuarios LOGUEADOS ---
        navHTML = `
            <a href="/index.html" class="navbar-brand">WorldCup<span>Guide</span></a>
            <div class="navbar-links">
                <a href="/index.html">Estadios</a>
                <!-- Aquí podrías añadir un enlace a "Mis Reservas" en el futuro -->
                <a href="#" onclick="logout()" class="btn btn-secondary">Cerrar Sesión</a>
            </div>
        `;
    } else {
        // --- Navbar para usuarios VISITANTES ---
        navHTML = `
            <a href="/index.html" class="navbar-brand">WorldCup<span>Guide</span></a>
            <div class="navbar-links">
                <a href="/login.html" class="btn btn-secondary">Iniciar Sesión</a>
                <a href="/register.html" class="btn btn-primary">Registrarse</a>
            </div>
        `;
    }

    navbarContainer.innerHTML = navHTML;
}


document.addEventListener('DOMContentLoaded', () => {
    renderNavbar();


    const path = window.location.pathname;

    if (path === '/' || path === '/index.html') {
        // Si estamos en la página de inicio, intentamos cargar los estadios.
        // La función loadStadiums() deberá estar en otro archivo (ej. stadiums.js)
        // o puedes añadirla aquí si prefieres.
        console.log('Estamos en la página de inicio.');
        // (Aquí llamaremos a la función para cargar estadios más adelante)
    }

    if (path === '/login.html') {
        // Si estamos en la página de login, preparamos el formulario.
        // (Aquí llamaremos a la función para inicializar el login más adelante)
        console.log('Estamos en la página de login.');
    }

    if (path === '/register.html') {
        // Si estamos en la página de registro, preparamos el formulario.
        // (Aquí llamaremos a la función para inicializar el registro más adelante)
        console.log('Estamos en la página de registro.');
    }
});
