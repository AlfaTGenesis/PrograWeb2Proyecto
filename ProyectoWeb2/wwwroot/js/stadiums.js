
document.addEventListener('DOMContentLoaded', () => {
    const container = document.getElementById('stadiums-list-container');
    if (container) {
        loadStadiums(container);
    }
});

/**
 * @param {HTMLElement} container 
 */
async function loadStadiums(container) {
    container.innerHTML = '<p class="text-center text-lg" style="color: var(--color-texto-secundario);">Cargando estadios...</p>';

    try {

        const response = await fetchWithAuth('/api/Stadiums');

        if (!response.ok) {
            throw new Error(`Error de red: ${response.statusText} (${response.status})`);
        }

        const stadiums = await response.json();

        container.innerHTML = '';

        if (stadiums.length === 0) {
            container.innerHTML = '<p class="text-center text-lg" style="color: var(--color-texto-secundario);">No hay estadios para mostrar en este momento.</p>';
            return;
        }

        stadiums.forEach(stadium => {
            const card = document.createElement('div');

            card.className = 'bg-gray-800 border border-gray-700 rounded-lg shadow-lg overflow-hidden transition-transform duration-300 hover:scale-105';

            const imageUrl = stadium.imageUrl || `https://placehold.co/600x400/2a2a2a/f0f0f0?text=${encodeURIComponent(stadium.name)}`;

            card.innerHTML = `
                <img src="${imageUrl}" alt="Imagen de ${stadium.name}" class="w-full h-48 object-cover">
                
                <div class="p-6">
                    <h3 class="text-2xl font-bold mb-2 text-white">${stadium.name}</h3>
                    <p class="text-base mb-4" style="color: var(--color-texto-secundario);">${stadium.city}</p>
                    
                    <!-- 
                        Este enlace lleva a la página de detalle del estadio (la que creamos en el paso anterior).
                        Pasamos el ID del estadio como un "query parameter" en la URL.
                    -->
                    <a href="/stadium.html?id=${stadium.stadiumId}" class="btn btn-primary inline-block">
                        Ver Hoteles Cercanos
                    </a>
                </div>
            `;

            container.appendChild(card);
        });

    } catch (error) {
        console.error('Error al cargar los estadios:', error);
        container.innerHTML = `
            <div class="col-span-full text-center p-6 bg-red-900 border border-red-700 rounded-lg">
                <p class="text-white text-lg">
                    Hubo un error al cargar los estadios.
                </p>
                <p class="text-red-300">${error.message}</p>
            </div>
        `;
    }
}

