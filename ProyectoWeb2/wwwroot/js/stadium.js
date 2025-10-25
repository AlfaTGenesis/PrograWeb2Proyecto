document.addEventListener('DOMContentLoaded', () => {
    const params = new URLSearchParams(window.location.search);
    const stadiumId = params.get('id');

    const loadingEl = document.getElementById('loading'); 
    const messageContainerEl = document.getElementById('message-container'); 
    const stadiumDetailContainerEl = document.getElementById('stadium-detail-container');
    const hotelsListContainerEl = document.getElementById('hotels-list-container');
    const attractionsListContainerEl = document.getElementById('attractions-list-container');
    const hotelsSectionEl = document.getElementById('hotels-section'); 
    const attractionsSectionEl = document.getElementById('attractions-section'); 

    if (!stadiumId) {
        if (loadingEl) loadingEl.classList.add('hidden'); 
        showMessage('Error: No se especificó un ID de estadio.', 'error');
        return;
    }


    const showMessage = (message, type) => {

        if (messageContainerEl) {
            messageContainerEl.innerHTML = `<div class="message ${type}">${message}</div>`;
            messageContainerEl.classList.remove('hidden');
        } else {

            console.error(message);

        }
    };



    const renderStadiumDetails = (stadium) => {
        stadiumDetailContainerEl.innerHTML = `
            <div class="bg-gray-800 rounded-lg shadow-lg overflow-hidden">
                <img src="${stadium.imageUrl || 'https://placehold.co/1200x600/374151/9CA3AF?text=Estadio'}" 
                     alt="Imagen de ${stadium.name}" class="w-full h-64 md:h-96 object-cover">
                <div class="p-6 md:p-8">
                    <h1 class="text-4xl lg:text-5xl font-bold mb-4">${stadium.name}</h1>
                    <p class="text-2xl text-gray-400 mb-2">${stadium.city}</p>
                    <p class="text-lg text-gray-300">Capacidad: ${stadium.capacity.toLocaleString('es-ES')} espectadores</p>
                </div>
            </div>
        `;
    };

    const renderHotels = (hotels) => {
        if (hotels.length === 0) {
            hotelsListContainerEl.innerHTML = '<p class="text-gray-400">No hay hoteles cercanos registrados para este estadio.</p>';
        } else {
            hotelsListContainerEl.innerHTML = hotels.map(hotel => `
                <!-- CADA HOTEL ES AHORA UN ENLACE -->
                <a href="/hotel.html?id=${hotel.hotelId}" 
                   class="block bg-gray-800 rounded-lg shadow overflow-hidden transition-transform duration-300 hover:scale-[1.03] hover:shadow-xl">
                    
                    <img src="${hotel.imageUrl || 'https://placehold.co/600x400/374151/9CA3AF?text=Hotel'}" 
                         alt="Imagen de ${hotel.name}" class="w-full h-48 object-cover">
                    
                    <div class="p-4">
                        <h4 class="text-xl font-semibold text-white mb-2 truncate">${hotel.name}</h4>
                        <div class="flex items-center text-yellow-400 mb-2">
                            <span class="text-lg">${'★'.repeat(Math.floor(hotel.stars))}</span>
                            <span class="text-gray-500">${'★'.repeat(5 - Math.floor(hotel.stars))}</span>
                            <span class="ml-2 text-sm text-gray-300">(${hotel.stars.toFixed(1)})</span>
                        </div>
                        <p class="text-sm text-gray-400 truncate">${hotel.address}</p>
                    </div>
                </a>
            `).join('');
        }
        if (hotelsSectionEl) hotelsSectionEl.classList.remove('hidden'); 
    };

    const renderAttractions = (attractions) => {
        if (attractions.length === 0) {
            attractionsListContainerEl.innerHTML = '<p class="text-gray-400">No hay atracciones cercanas registradas para este estadio.</p>';
        } else {
            attractionsListContainerEl.innerHTML = attractions.map(attraction => `
                <div class="bg-gray-800 rounded-lg shadow overflow-hidden">
                    <img src="${attraction.imageUrl || 'https://placehold.co/600x400/374151/9CA3AF?text=Atraccion'}" 
                         alt="Imagen de ${attraction.name}" class="w-full h-48 object-cover">
                    <div class="p-4">
                        <h4 class="text-xl font-semibold text-white mb-2 truncate">${attraction.name}</h4>
                        <span class="inline-block bg-teal-600 text-teal-100 text-xs font-semibold px-2 py-1 rounded-full mb-2">${attraction.type}</span>
                        <p class="text-sm text-gray-400 line-clamp-2">${attraction.description}</p>
                    </div>
                </div>
            `).join('');
        }
        if (attractionsSectionEl) attractionsSectionEl.classList.remove('hidden'); 
    };



    const loadStadiumDetails = async () => {
        try {
            const response = await fetchWithAuth(`/api/Stadiums/${stadiumId}`); 

            if (!response.ok) {
                const errorData = await response.json();
                throw new Error(errorData.message || `Error de red: ${response.statusText}`);
            }

            const stadiumData = await response.json();

            if (loadingEl) loadingEl.classList.add('hidden'); 
            if (stadiumDetailContainerEl) stadiumDetailContainerEl.classList.remove('hidden'); 

            renderStadiumDetails(stadiumData);
            renderHotels(stadiumData.hotels);
            renderAttractions(stadiumData.touristAttractions);

        } catch (error) {
            console.error('Error al cargar detalles del estadio:', error);
            if (loadingEl) loadingEl.classList.add('hidden'); 
            showMessage(error.message, 'error');
        }
    };

    loadStadiumDetails();
});

