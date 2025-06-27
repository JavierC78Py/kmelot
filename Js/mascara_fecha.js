function mascaraFechaRegex(campo) {
    $(campo).on('input', function(e) {
        let value = e.target.value.replace(/\D/g, '');
        // Limitar a máximo 8 dígitos
        if (value.length > 8) {
            value = value.substring(0, 8);
        }
        // Validar y ajustar día (01-31)
        if (value.length >= 2) {
            let dia = parseInt(value.substring(0, 2));
            let mes = value.length >= 4 ? parseInt(value.substring(2, 4)) : 1; // Mes predeterminado: enero
            let anio = value.length >= 8 ? parseInt(value.substring(4, 8)) : 2024; // Año predeterminado: 2024
            // Obtener el número máximo de días para el mes
            const maxDias = getMaxDaysOfMonth(mes, anio);
            // Ajustar el día si es inválido
            if (dia < 1) dia = 1;
            if (dia > maxDias) dia = maxDias;
            value = ("0" + dia).slice(-2) + value.substring(2);
        }
        // Validar y ajustar mes (01-12)
        if (value.length >= 4) {
            let mes = parseInt(value.substring(2, 4));
            if (mes < 1) mes = 1;
            if (mes > 12) mes = 12;
            value = value.substring(0, 2) + ("0" + mes).slice(-2) + value.substring(4);
        }
        // Validar año (opcional)
        if (value.length >= 8) {
            let anio = parseInt(value.substring(4, 8));
            if (anio < 1900) anio = 1900;
            if (anio > 2100) anio = 2100;
            value = value.substring(0, 4) + anio;
        }
        // Aplicar formato dd-mm-yyyy
        value = value.replace(/^(\d{2})(\d)/g, "$1-$2");
        value = value.replace(/^(\d{2})\-(\d{2})(\d)/g, "$1-$2-$3");
        // Validar que sea una fecha real
        if (value.length === 10) {
            const partes = value.split('-');
            const [dia, mes, anio] = partes;
            if (!isValidDate(dia, mes, anio)) {
                $(this).css('border-color', 'red'); // Marcar error
                console.warn("Fecha inválida");
            } else {
                $(this).css('border-color', ''); // Limpiar error
            }
        }
        $(this).val(value);
    });
}
// Función auxiliar para obtener el número máximo de días de un mes
function getMaxDaysOfMonth(month, year) {
    const date = new Date(year, month, 0); // El día 0 obtiene el último día del mes anterior
    return date.getDate();
}
// Función auxiliar para validar fecha completa
function isValidDate(day, month, year) {
    const date = new Date(year, month - 1, day);
    return (
        date.getDate() === parseInt(day) &&
        date.getMonth() === parseInt(month) - 1 &&
        date.getFullYear() === parseInt(year)
    );
}