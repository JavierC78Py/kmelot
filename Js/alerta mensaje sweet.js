function bloquearTabulador(event) {
    if (event.keyCode === 9 || event.keyCode === 32) {
        event.preventDefault();
    }
}
// Esperar a que la página esté completamente cargada
$(document).ready(function() {
    // Esperar 2 segundos para asegurar que APEX cargó
    setTimeout(function() {
        try {
            // Verificar que el item existe y tiene valor
            if (apex.item("P5_ID_PLAN") && $v("P5_ID_PLAN") == 253) {
                console.log('Mostrando alerta para Sindicatura...');
                Swal.fire({
                    title: "Observación del cliente",
                    icon: 'warning',
                    html: "NO REQUIERE PRESENTACION DE RECETA (EXCEPTO PARA MEDICAMENTOS CONTROLADOS) Plan Sindicatura general de quiebras.",
                    showCancelButton: false,
                    confirmButtonText: 'Aceptar',
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    allowEnterKey: false,
                    stopKeydownPropagation: true,
                    backdrop: true,
                    focusConfirm: true,
                    color: "#ffffff",
                    background: "red",
                }).then((result) => {
                    window.removeEventListener('keydown', bloquearTabulador);
                });
                window.addEventListener('keydown', bloquearTabulador);
            } else {
                console.log('No es necesario mostrar alerta. ID PLAN:', $v("P5_ID_PLAN"));
            }
        } catch (error) {
            console.error('Error:', error);
        }
    }, 2000);
});