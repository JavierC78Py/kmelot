(function($) {
    /**
     * Parsea un valor numérico de un string, considerando separadores de miles '.' y decimales ','.
     * @param {string|number|null|undefined} value El valor a parsear.
     * @returns {number} El número parseado o 0 si el valor es inválido.
     */
    function parseCurrency(value) {
        console.log('antes '+value);
        if (value === null || value === undefined) {
            return 0;
        }
        let strValue = String(value);
        if (typeof strValue === 'string') {
            strValue = strValue.replace(/\./g, '').replace(',', '.');
        }
        const num = parseFloat(strValue);
        console.log('despues '+num);
        return isNaN(num) ? 0 : num;
    }
    function update(model) {
        const montoKey = model.getFieldKey("MONTO");

        let total = 0;

        console.log(">> starting sum MONTO column");

        model.forEach(function(record, index, id) {
            const meta = model.getRecordMetadata(id);

            if (!meta.deleted && !meta.agg) {
                const monto = parseCurrency(record[montoKey]);
                total += monto;
            }
        });
        const format = (num) => num.toFixed(0);
        console.log(`>> setting total - TOTAL: ${format(total)}`);
        try {
            $s("P159_TOTAL", format(total));
        } catch (e) {
            console.error("Error al actualizar items:", e);
        }
    }
    $(function() {
        $("#REG_DETALLE").on("interactivegridviewmodelcreate", function(event, ui) {
            const model = ui.model;
            if (ui.viewId === "grid") {
                model.subscribe({
                    onChange: function(type, change) {
                        console.log(">> model changed ", type, change);
                        if (type === "set") {
                            if (change.field === "MONTO") {
                                update(model);
                            }
                        } else if (type !== "move" && type !== "metaChange") {
                            update(model);
                        }
                    },
                    progressView: $("#P159_TOTAL")
                });
                update(model);
                model.fetchAll(function() {});
            }
        });
    });
})(apex.jQuery);