// --- INICIO DE LA ACTUALIZACIÓN ---
// Envolvemos todo el código en un solo DOMContentLoaded
document.addEventListener('DOMContentLoaded', () => {

    // --- Variables Globales para esta página ---
    const params = new URLSearchParams(window.location.search);
    const hotelId = params.get('id');

    // --- Elementos del DOM ---
    const loadingEl = document.getElementById('loading');
    const messageContainerEl = document.getElementById('message-container');
    const hotelContentEl = document.getElementById('hotel-content');
    const hotelDetailContainerEl = document.getElementById('hotel-detail-container');
    const reviewsSectionEl = document.getElementById('reviews-section');
    const reviewsListEl = document.getElementById('reviews-list');
    const reviewFormContainerEl = document.getElementById('review-form-container');
    const reviewFormEl = document.getElementById('review-form');
    const reviewMessageEl = document.getElementById('review-message');

    // Elementos del formulario de reserva
    const bookingFormContainerEl = document.getElementById('booking-form-container');
    const bookingLoginPromptEl = document.getElementById('booking-login-prompt');
    const bookingFormEl = document.getElementById('booking-form');
    const bookingMessageEl = document.getElementById('booking-message');

    // --- Funciones Auxiliares ---

    /**
     * Muestra un mensaje en un contenedor específico.
     * @param {string} message - El mensaje a mostrar.
     * @param {'success' | 'error' | 'info'} type - El tipo de mensaje.
     * @param {HTMLElement} container - El elemento contenedor donde se mostrará el mensaje.
     */
    const showMessage = (message, type, container) => {
        if (!container) return;
        container.innerHTML = `<div class="message ${type}">${message}</div>`;
        container.classList.remove('hidden');
    };

    /**
     * Establece la fecha mínima para los inputs de fecha (hoy).
     */
    const setMinDate = () => {
        const today = new Date().toISOString().split('T')[0];
        if (bookingFormEl) {
            bookingFormEl.checkInDate.min = today;
            bookingFormEl.checkOutDate.min = today;
        }
    };

    // --- Funciones de Renderizado ---

    const renderHotelDetails = (hotel) => {
        hotelDetailContainerEl.innerHTML = `
            <div class="bg-gray-800 rounded-lg shadow-lg overflow-hidden">
                <img src="${hotel.imageUrl || 'https://placehold.co/1200x600/374151/9CA3AF?text=Hotel'}" 
                     alt="Imagen de ${hotel.name}" class="w-full h-64 object-cover">
                <div class="p-6 md:p-8">
                    <h1 class="text-4xl font-bold mb-4">${hotel.name}</h1>
                    <div class="flex items-center mb-4 text-yellow-400">
                        <span class="text-2xl">${'★'.repeat(Math.floor(hotel.stars))}</span>
                        <span class="text-gray-400">${'★'.repeat(5 - Math.floor(hotel.stars))}</span>
                        <span class="ml-2 text-xl text-gray-300">(${hotel.stars.toFixed(1)} estrellas)</span>
                    </div>
                    <p class="text-lg text-gray-400 mb-6">${hotel.address}</p>
                    <p class="text-gray-300 mb-6">${hotel.description || 'No hay descripción disponible.'}</p>
                    ${hotel.stadiumName ? `
                        <p class="text-md text-teal-400">
                            Cercano a: 
                            <span class="font-semibold">${hotel.stadiumName}</span>
                        </p>` : ''}
                </div>
            </div>
        `;
        hotelContentEl.classList.remove('hidden'); // Muestra el grid principal
    };

    const renderReviews = (reviews) => {
        if (!reviewsListEl) return;
        if (reviews.length === 0) {
            reviewsListEl.innerHTML = '<p class="text-gray-400">Este hotel aún no tiene reseñas. ¡Sé el primero!</p>';
        } else {
            reviewsListEl.innerHTML = reviews.map(review => `
                <div class="bg-gray-800 p-5 rounded-lg shadow">
                    <div class="flex justify-between items-center mb-2">
                        <span class="font-semibold text-lg text-teal-400">${review.userName || 'Anónimo'}</span>
                        <span class="text-yellow-400">${'★'.repeat(review.rating)}<span class="text-gray-600">${'★'.repeat(5 - review.rating)}</span></span>
                    </div>
                    <p class="text-gray-300 mb-3">${review.comment || '<i>Sin comentario.</i>'}</p>
                    <p class="text-xs text-gray-500">${new Date(review.datePosted).toLocaleString('es-ES')}</p>
                </div>
            `).join('');
        }
        reviewsSectionEl.classList.remove('hidden');
    };

    const addReviewToDOM = (review) => {
        if (!reviewsListEl) return;
        if (reviewsListEl.querySelector('p')) {
            reviewsListEl.innerHTML = '';
        }

        const reviewEl = document.createElement('div');
        reviewEl.className = 'bg-gray-800 p-5 rounded-lg shadow';
        reviewEl.innerHTML = `
            <div class="flex justify-between items-center mb-2">
                <span class="font-semibold text-lg text-teal-400">${review.userName || 'Anónimo'}</span>
                <span class="text-yellow-400">${'★'.repeat(review.rating)}<span class="text-gray-600">${'★'.repeat(5 - review.rating)}</span></span>
            </div>
            <p class="text-gray-300 mb-3">${review.comment || '<i>Sin comentario.</i>'}</p>
            <p class="text-xs text-gray-500">${new Date(review.datePosted).toLocaleString('es-ES')}</p>
        `;
        reviewsListEl.prepend(reviewEl);
    };

    // --- Funciones de Lógica de Formularios ---

    const setupReviewForm = (hotelId) => {
        if (!reviewFormEl || !reviewFormContainerEl) return;

        if (isUserLoggedIn()) {
            reviewFormContainerEl.classList.remove('hidden');
        }

        reviewFormEl.addEventListener('submit', async (e) => {
            e.preventDefault();
            const rating = reviewFormEl.rating.value;
            const comment = reviewFormEl.comment.value;

            const body = {
                hotelId: parseInt(hotelId),
                rating: parseInt(rating),
                comment: comment
            };

            try {
                const response = await fetchWithAuth('/api/Reviews', {
                    method: 'POST',
                    body: JSON.stringify(body)
                });

                if (!response.ok) {
                    const errorData = await response.json();
                    throw new Error(errorData.message || 'Error al publicar la reseña.');
                }

                const newReview = await response.json();

                addReviewToDOM(newReview);

                reviewFormEl.reset();
                showMessage('¡Reseña publicada con éxito!', 'success', reviewMessageEl);
                setTimeout(() => reviewMessageEl.classList.add('hidden'), 3000);

            } catch (error) {
                console.error('Error al publicar reseña:', error);
                showMessage(error.message, 'error', reviewMessageEl);
            }
        });
    };

    // --- INICIO DE LA LÓGICA DE RESERVA ---

    const setupBookingForm = (hotelId) => {
        if (!bookingFormContainerEl || !bookingLoginPromptEl || !bookingFormEl) return;

        if (isUserLoggedIn()) {
            bookingFormContainerEl.classList.remove('hidden');
            setMinDate();
        } else {
            bookingLoginPromptEl.classList.remove('hidden');
        }

        bookingFormEl.addEventListener('submit', async (e) => {
            e.preventDefault();

            // Ocultar mensajes anteriores
            bookingMessageEl.classList.add('hidden');

            const checkIn = bookingFormEl.checkInDate.value;
            const checkOut = bookingFormEl.checkOutDate.value;
            const guests = bookingFormEl.numberOfGuests.value;

            // Validación simple de fechas
            if (new Date(checkOut) <= new Date(checkIn)) {
                showMessage('La fecha de salida debe ser posterior a la fecha de entrada.', 'error', bookingMessageEl);
                return;
            }

            const body = {
                hotelId: parseInt(hotelId),
                checkInDate: checkIn,
                checkOutDate: checkOut,
                numberOfGuests: parseInt(guests)
            };

            try {
                const response = await fetchWithAuth('/api/Bookings', {
                    method: 'POST',
                    body: JSON.stringify(body)
                });

                if (!response.ok) {
                    let errorMessage = 'Error al crear la reserva.' + userName;
                    try {
                        // Solo intenta leer JSON si hay contenido
                        const text = await response.text();
                        if (text) {
                            const errorData = JSON.parse(text);
                            errorMessage = errorData.message || errorMessage;
                        }
                    } catch (e) {
                        // Si falla el parseo, usa el mensaje por defecto
                    }
                    throw new Error(errorMessage);
                }

                // Éxito
                showMessage('¡Reserva creada con éxito! Serás redirigido a "Mis Reservas"...', 'success', bookingMessageEl);

                // Redirigir a la página de reservas después de 2 segundos
                setTimeout(() => {
                    window.location.href = '/reservas.html';
                }, 2000);

            } catch (error) {
                console.error('Error al crear reserva:', error);
                showMessage(error.message, 'error', bookingMessageEl);
            }
        });
    };
    // --- FIN DE LA LÓGICA DE RESERVA ---


    // --- Función Principal de Carga ---

    const loadHotelDetails = async () => {
        if (!hotelId) {
            if (loadingEl) loadingEl.classList.add('hidden');
            showMessage('Error: No se especificó un ID de hotel.', 'error', messageContainerEl);
            return;
        }

        try {
            const response = await fetchWithAuth(`/api/Hotels/${hotelId}`);

            if (!response.ok) {
                const errorData = await response.json();
                throw new Error(errorData.message || `Error de red: ${response.statusText}`);
            }

            const hotelData = await response.json();

            if (loadingEl) loadingEl.classList.add('hidden');

            // Renderizar todo el contenido
            renderHotelDetails(hotelData);
            renderReviews(hotelData.reviews);

            // Configurar los formularios
            setupReviewForm(hotelId);
            setupBookingForm(hotelId); // <--- AÑADIDO

        } catch (error) {
            console.error('Error al cargar detalles del hotel:', error);
            if (loadingEl) loadingEl.classList.add('hidden');
            showMessage(error.message, 'error', messageContainerEl);
        }
    };

    // --- Punto de Entrada ---
    loadHotelDetails();
});