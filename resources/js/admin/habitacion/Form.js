import AppForm from '../app-components/Form/AppForm';



Vue.component('habitacion-form', {
    mixins: [AppForm],
    data: function() {
        return {
            form: {
                numero:  '' ,
                tipo:  '' ,
                costo:  '' ,
                estado:  '' ,

            }
        }
    }

});
