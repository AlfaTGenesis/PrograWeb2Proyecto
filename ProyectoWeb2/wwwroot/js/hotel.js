document.addEventListener('DOMContentLoaded', () => {
    const params = new URLSearchParams(window.location.search);
    const hotelId = params.get('id');

    const loadingEl = document.getElementById('loading');
    const messageContainerEl = document.getElementById('message-container');
    const hotelDetailContainerEl = document.getElementById('hotel-detail-container');
    const reviewsSectionEl = document.getElementById('reviews-section');
    const reviewsListEl = document.getElementById('reviews-list');
    const reviewFormContainerEl = document.getElementById('review-form-container');
    const reviewFormEl = document.getElementById('review-form');
    const reviewMessageEl = document.getElementById('review-message');

    if (!hotelId) {
        loadingEl.classList.add('hidden');
        showMessage('Error: No se especificó un ID de hotel.', 'error', messageContainerEl);
        return;
    }

    const showMessage = (message, type, container) => {
        container.innerHTML = `<div class="message ${type}">${message}</div>`;
        container.classList.remove('hidden');
    };

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
        hotelDetailContainerEl.classList.remove('hidden');
    };

    const renderReviews = (reviews) => {
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

    const setupReviewForm = (hotelId) => {
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
                const response = await fetchWithAuth('/api/Reviews', 'POST', body);

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

    const loadHotelDetails = async () => {
        try {
            const response = await fetchWithAuth(`/api/Hotels/${hotelId}`);
            
            if (!response.ok) {
                const errorData = await response.json();
                throw new Error(errorData.message || `Error de red: ${response.statusText}`);
            }

            const hotelData = await response.json();

            loadingEl.classList.add('hidden');
            

            renderHotelDetails(hotelData);
            renderReviews(hotelData.reviews);
            setupReviewForm(hotelId);

        } catch (error) {
            console.error('Error al cargar detalles del hotel:', error);
            loadingEl.classList.add('hidden');
            showMessage(error.message, 'error', messageContainerEl);
        }
    };

    loadHotelDetails();
});

