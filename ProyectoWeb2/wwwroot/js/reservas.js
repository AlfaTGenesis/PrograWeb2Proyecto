document.addEventListener('DOMContentLoaded', () => {
    const listContainerEl = document.getElementById('bookings-list-container');
    const messageContainerEl = document.getElementById('message-container');

    const showMessage = (message, type = 'error') => {
        if (!messageContainerEl) return;
        messageContainerEl.innerHTML = `<p class="message ${type}">${message}</p>`;
    };

    const renderBookings = (bookings) => {
        if (!listContainerEl) return;

        if (bookings.length === 0) {
            showMessage('Aún no tienes ninguna reserva.', 'info');
            return;
        }

        listContainerEl.innerHTML = bookings.map(booking => {
            const checkIn = new Date(booking.checkInDate).toLocaleDateString('es-ES');
            const checkOut = new Date(booking.checkOutDate).toLocaleDateString('es-ES');

            return `
                <div class="card bg-gray-800 flex flex-col md:flex-row shadow-lg overflow-hidden">
                    <img src="${booking.hotelImageUrl || 'https://placehold.co/400x300/374151/9CA3AF?text=Hotel'}" 
                         alt="Imagen de ${booking.hotelName}" 
                         class="w-full md:w-1/3 h-48 md:h-auto object-cover">
                    <div class="p-6 flex-1">
                        <h3 class="text-2xl font-bold mb-2">${booking.hotelName}</h3>
                        <p class="text-gray-400 mb-4">${booking.hotelAddress}</p>
                        <div class="grid grid-cols-2 gap-4 text-lg">
                            <div>
                                <p class="font-semibold">Check-In:</p>
                                <p class="text-gray-300">${checkIn}</p>
                            </div>
                            <div>
                                <p class="font-semibold">Check-Out:</p>
                                <p class="text-gray-300">${checkOut}</p>
                            </div>
                            <div>
                                <p class="font-semibold">Huéspedes:</p>
                                <p class="text-gray-300">${booking.numberOfGuests}</p>
                            </div>
                            <div>
                                <p class="font-semibold">Reserva ID:</p>
                                <p class="text-gray-300">${booking.bookingId}</p>
                            </div>
                        </div>
                    </div>
                </div>
            `;
        }).join('');
    };

    const loadBookings = async () => {

        if (!localStorage.getItem('jwtToken')) {
            showMessage('Necesitas iniciar sesión para ver tus reservas.', 'error');
            return;
        }

        showMessage('Cargando tus reservas...', 'info');

        try {
            const response = await fetchWithAuth('/api/Bookings');

            if (!response.ok) {
                const errorData = await response.json();
                throw new Error(errorData.message || 'Error al cargar las reservas.');
            }

            const bookings = await response.json();
            messageContainerEl.innerHTML = ''; 
            renderBookings(bookings);

        } catch (error) {
            console.error('Error en loadBookings:', error);
            showMessage(error.message, 'error');
        }
    };


    loadBookings();
});

