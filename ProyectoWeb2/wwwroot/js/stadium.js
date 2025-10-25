/*
    stadium.js (en SINGULAR)
    Lógica específica para la página stadium.html.
*/

document.addEventListener('DOMContentLoaded', () => {
    // 1. Obtener el ID del estadio desde la URL
    // Ej. stadium.html?id=1 -> urlParams.get('id') nos dará "1"
    const urlParams = new URLSearchParams(window.location.search);
    const stadiumId = urlParams.get('id');

    if (!stadiumId) {
        // Si no hay ID, mostrar un error
        document.querySelector('main.app-container').innerHTML =
            '<h1 class="text-3xl text-center text-red-400">Error: No se especificó un ID de estadio.</h1>';
        return;
    }

    // 2. Cargar los detalles del estadio
    loadStadiumDetails(stadiumId);
});

/**
 * Carga los detalles de UN estadio (incluyendo hoteles y atracciones) desde la API.
 * @param {string} stadiumId - El ID del estadio a cargar.
 */
async function loadStadiumDetails(stadiumId) {
    const detailContainer = document.getElementById('stadium-detail-container');
    const hotelsContainer = document.getElementById('hotels-list-container');
    // --- INICIO DE LA ACTUALIZACIÓN (Obtener el nuevo contenedor) ---
    const attractionsContainer = document.getElementById('attractions-list-container');
    // --- FIN DE LA ACTUALIZACIÓN ---

    try {
        // Mostramos un estado de carga general
        detailContainer.innerHTML = '<p class="text-center text-lg" style="color: var(--color-texto-secundario);">Cargando detalles del estadio...</p>';
        hotelsContainer.innerHTML = '';
        attractionsContainer.innerHTML = ''; // Limpiamos el nuevo contenedor

        // 3. Llamar al endpoint de detalle de la API
        const response = await fetchWithAuth(`/api/Stadiums/${stadiumId}`);

        if (!response.ok) {
            const errorData = await response.json();
            throw new Error(errorData.message || `Error de red: ${response.status}`);
        }

        const stadiumData = await response.json();

        // 4. Renderizar las tres partes de la página
        renderStadiumInfo(stadiumData, detailContainer);
        renderHotels(stadiumData.hotels, hotelsContainer);

        // --- INICIO DE LA ACTUALIZACIÓN (Llamar a la nueva función de render) ---
        renderTouristAttractions(stadiumData.touristAttractions, attractionsContainer);
        // --- FIN DE LA ACTUALIZACIÓN ---

    } catch (error) {
        console.error('Error al cargar detalles del estadio:', error);
        detailContainer.innerHTML = `
            <div class="col-span-full text-center p-6 bg-red-900 border border-red-700 rounded-lg">
                <p class="text-white text-lg">Hubo un error al cargar el estadio.</p>
                <p class="text-red-300">${error.message}</p>
            </div>`;
    }
}

/**
 * Renderiza la información principal del estadio.
 * @param {object} stadium - El objeto de detalle del estadio.
 * @param {HTMLElement} container - El contenedor para la info principal.
 */
function renderStadiumInfo(stadium, container) {
    const imageUrl = stadium.imageUrl || `https://placehold.co/1200x600/2a2a2a/f0f0f0?text=${encodeURIComponent(stadium.name)}`;
    container.innerHTML = `
        <div class="bg-gray-800 border border-gray-700 rounded-lg shadow-lg overflow-hidden">
            <img src="${imageUrl}" alt="Imagen de ${stadium.name}" class="w-full h-64 md:h-96 object-cover">
            <div class="p-6 md:p-10">
                <h1 class="text-4xl md:text-5xl font-bold text-white mb-4">${stadium.name}</h1>
                <p class="text-xl md:text-2xl" style="color: var(--color-texto-secundario);">${stadium.city}</p>
                <p class="text-lg mt-2" style="color: var(--color-texto-secundario);">Capacidad: ${stadium.capacity.toLocaleString()} espectadores</p>
            </div>
        </div>
    `;
}

/**
 * Renderiza la lista de hoteles.
 * @param {Array} hotels - La lista de objetos HotelDto.
 * @param {HTMLElement} container - El contenedor para las tarjetas de hotel.
 */
function renderHotels(hotels, container) {
    if (hotels.length === 0) {
        container.innerHTML = '<p class="text-lg" style="color: var(--color-texto-secundario);">No hay hoteles cercanos registrados para este estadio.</p>';
        return;
    }

    hotels.forEach(hotel => {
        const card = document.createElement('div');
        card.className = 'card-base'; // Usamos un estilo base
        const imageUrl = hotel.imageUrl || `https://placehold.co/600x400/2a2a2a/f0f0f0?text=${encodeURIComponent(hotel.name)}`;

        card.innerHTML = `
            <img src="${imageUrl}" alt="Imagen de ${hotel.name}" class="w-full h-48 object-cover">
            <div class="p-6">
                <h3 class="text-2xl font-bold mb-2 text-white">${hotel.name}</h3>
                <p class="text-yellow-400 mb-4">${'★'.repeat(hotel.stars)}${'☆'.repeat(5 - hotel.stars)}</p>
                <!-- Opcional: Enlace a la futura página de detalle del hotel -->
                <!-- <a href="/hotel.html?id=${hotel.hotelId}" class="btn btn-secondary">Ver Detalles</a> -->
            </div>
        `;
        container.appendChild(card);
    });
}

// --- INICIO DE LA ACTUALIZACIÓN (Nueva función de render) ---

/**
 * Renderiza la lista de atracciones turísticas.
 * @param {Array} attractions - La lista de objetos TouristAttractionDto.
 * @param {HTMLElement} container - El contenedor para las tarjetas de atracciones.
 */
function renderTouristAttractions(attractions, container) {
    if (attractions.length === 0) {
        container.innerHTML = '<p class="text-lg" style="color: var(--color-texto-secundario);">No hay atracciones turísticas cercanas registradas.</p>';
        return;
    }

    attractions.forEach(attraction => {
        const card = document.createElement('div');
        card.className = 'card-base'; // Reutilizamos el estilo base
        const imageUrl = attraction.imageUrl || `https://placehold.co/600x400/2a2a2a/f0f0f0?text=${encodeURIComponent(attraction.name)}`;

        card.innerHTML = `
            <img src="${imageUrl}" alt="Imagen de ${attraction.name}" class="w-full h-48 object-cover">
            <div class="p-6">
                <h3 class="text-2xl font-bold mb-2 text-white">${attraction.name}</h3>
                <!-- Mostramos el tipo de atracción (Restaurante, Parque, etc.) -->
                <p class_="text-base font-medium uppercase tracking-wider mb-2" style="color: var(--color-primario);">${attraction.type || 'Atracción'}</p>
                <p class="text-base" style="color: var(--color-texto-secundario);">${attraction.description || ''}</p>
            </div>
        `;
        container.appendChild(card);
    });
}
// --- FIN DE LA ACTUALIZACIÓN ---

