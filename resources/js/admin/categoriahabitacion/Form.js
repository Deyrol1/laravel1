import AppForm from '../app-components/Form/AppForm';

Vue.component('categoriahabitacion-form', {
    mixins: [AppForm],
    data: function() {
        return {
            form: {
                categoria:  '' ,
                valor:  '' ,
                
            }
        }
    }

});