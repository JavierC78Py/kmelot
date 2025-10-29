function mascaraFechaHoraRegex(campo) {
  $(campo).on('input', function(e) {
    let value = e.target.value.replace(/\D/g, '');
    // Limitar a máximo 12 dígitos
    if (value.length > 12) {
      value = value.substring(0, 12);
        }
        // Validar y ajustar día (01-31)
        if (value.length >= 2) {
          let dia = parseInt(value.substring(0, 2));
          if (dia > 31) value = "31" + value.substring(2);
            if (dia < 1 && value.length >= 2) value = "01" + value.substring(2);
        }      
        // Validar y ajustar mes (01-12)
        if (value.length >= 4) {
          let mes = parseInt(value.substring(2, 4));
          if (mes > 12) value = value.substring(0, 2) + "12" + value.substring(4);
          if (mes < 1 && value.length >= 4) value = value.substring(0, 2) + "01" + value.substring(4);
        }
        // Validar y ajustar hora (00-23)
        if (value.length >= 10) {
          let hora = parseInt(value.substring(8, 10));
          if (hora > 23) value = value.substring(0, 8) + "23" + value.substring(10);
        }
        // Validar y ajustar minutos (00-59)
        if (value.length >= 12) {
          let minutos = parseInt(value.substring(10, 12));
          if (minutos > 59) value = value.substring(0, 10) + "59";
        }
        // Aplicar formato
        value = value.replace(/^(\d{2})(\d)/g, "$1-$2");
        value = value.replace(/^(\d{2})\-(\d{2})(\d)/g, "$1-$2-$3");
        value = value.replace(/^(\d{2})\-(\d{2})\-(\d{4})(\d)/g, "$1-$2-$3 $4");
        value = value.replace(/^(\d{2})\-(\d{2})\-(\d{4})\s(\d{2})(\d)/g, "$1-$2-$3 $4:$5");
        $(this).val(value);
    });
}
