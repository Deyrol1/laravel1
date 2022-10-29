import AppForm from '../app-components/Form/AppForm';

Vue.component('estadohabitacion-form', {
    mixins: [AppForm],
    data: function() {
        return {
            form: {
                estado:  '' ,
                
            }
        }
    }

});