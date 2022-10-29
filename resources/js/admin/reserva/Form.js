import AppForm from '../app-components/Form/AppForm';

Vue.component('reserva-form', {
    mixins: [AppForm],
    data: function() {
        return {
            form: {
                fecha_inicio:  '' ,
                fecha_fin:  '' ,
                nombre_cliente:  '' ,
                tipo_habitacion:  '' ,
                num_habitacion:  '' ,
                dias:  '' ,
                valor_total:  '' ,
                
            }
        }
    }

});