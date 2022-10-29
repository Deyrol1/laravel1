

<div class="form-group row align-items-center" :class="{'has-danger': errors.has('fecha_inicio'), 'has-success': fields.fecha_inicio && fields.fecha_inicio.valid }">
    <label for="fecha_inicio" class="col-form-label text-md-right" :class="isFormLocalized ? 'col-md-4' : 'col-md-2'">{{ trans('admin.reserva.columns.fecha_inicio') }}</label>
    <div :class="isFormLocalized ? 'col-md-4' : 'col-sm-8'">
        <div class="input-group input-group--custom">
            <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
            <datetime v-model="form.fecha_inicio" :config="datePickerConfig" v-validate="'required|date_format:yyyy-MM-dd HH:mm:ss'" class="flatpickr" :class="{'form-control-danger': errors.has('fecha_inicio'), 'form-control-success': fields.fecha_inicio && fields.fecha_inicio.valid}" id="fecha_inicio" name="fecha_inicio" placeholder="{{ trans('brackets/admin-ui::admin.forms.select_a_date') }}"></datetime>
        </div>
        <div v-if="errors.has('fecha_inicio')" class="form-control-feedback form-text" v-cloak>@{{ errors.first('fecha_inicio') }}</div>
    </div>
</div>

<div class="form-group row align-items-center" :class="{'has-danger': errors.has('fecha_fin'), 'has-success': fields.fecha_fin && fields.fecha_fin.valid }">
    <label for="fecha_fin" class="col-form-label text-md-right" :class="isFormLocalized ? 'col-md-4' : 'col-md-2'">{{ trans('admin.reserva.columns.fecha_fin') }}</label>
    <div :class="isFormLocalized ? 'col-md-4' : 'col-sm-8'">
        <div class="input-group input-group--custom">
            <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
            <datetime v-model="form.fecha_fin" :config="datePickerConfig" v-validate="'required|date_format:yyyy-MM-dd HH:mm:ss'" class="flatpickr" :class="{'form-control-danger': errors.has('fecha_fin'), 'form-control-success': fields.fecha_fin && fields.fecha_fin.valid}" id="fecha_fin" name="fecha_fin" placeholder="{{ trans('brackets/admin-ui::admin.forms.select_a_date') }}"></datetime>
        </div>
        <div v-if="errors.has('fecha_fin')" class="form-control-feedback form-text" v-cloak>@{{ errors.first('fecha_fin') }}</div>
    </div>
</div>

<div class="form-group row align-items-center" :class="{'has-danger': errors.has('nombre_cliente'), 'has-success': fields.nombre_cliente && fields.nombre_cliente.valid }">
    <label for="nombre_cliente" class="col-form-label text-md-right" :class="isFormLocalized ? 'col-md-4' : 'col-md-2'">{{ trans('admin.reserva.columns.nombre_cliente') }}</label>
        <div :class="isFormLocalized ? 'col-md-4' : 'col-md-9 col-xl-8'">
        <input type="text" v-model="form.nombre_cliente" v-validate="'required'" @input="validate($event)" class="form-control" :class="{'form-control-danger': errors.has('nombre_cliente'), 'form-control-success': fields.nombre_cliente && fields.nombre_cliente.valid}" id="nombre_cliente" name="nombre_cliente" placeholder="{{ trans('admin.reserva.columns.nombre_cliente') }}">
        <div v-if="errors.has('nombre_cliente')" class="form-control-feedback form-text" v-cloak>@{{ errors.first('nombre_cliente') }}</div>
    </div>
</div>

<div class="form-group row align-items-center" :class="{'has-danger': errors.has('tipo_habitacion'), 'has-success': fields.tipo_habitacion && fields.tipo_habitacion.valid }">
    <label for="tipo_habitacion" class="col-form-label text-md-right" :class="isFormLocalized ? 'col-md-4' : 'col-md-2'">{{ trans('admin.reserva.columns.tipo_habitacion') }}</label>
        <div :class="isFormLocalized ? 'col-md-4' : 'col-md-9 col-xl-8'">
            <select class="form-select form-control" aria-label="Default select example" v-model="form.tipo_habitacion" v-validate="'required'" @input="validate($event)" :class="{'form-control-danger': errors.has('tipo_habitacion'), 'form-control-success': fields.tipo_habitacion && fields.tipo_habitacion.valid}" id="tipo_habitacion" name="tipo_habitacion" placeholder="{{ trans('admin.habitacion.columns.numero') }}">
                @foreach ($tipos as $tipo)

                     <option value="{{ $tipo['categoria'] }}">{{ $tipo['categoria'] }}-{{ $tipo['valor'] }}</option disabled>
                @endforeach
               </select>

        <div v-if="errors.has('tipo_habitacion')" class="form-control-feedback form-text" v-cloak>@{{ errors.first('tipo_habitacion') }}</div>
    </div>
</div>



<div class="form-group row align-items-center" :class="{'has-danger': errors.has('dias'), 'has-success': fields.dias && fields.dias.valid }">
    <label for="dias" class="col-form-label text-md-right" :class="isFormLocalized ? 'col-md-4' : 'col-md-2'">{{ trans('admin.reserva.columns.dias') }}</label>
        <div :class="isFormLocalized ? 'col-md-4' : 'col-md-9 col-xl-8'">
        <input type="text" v-model="form.dias" v-validate="'required|integer'" @input="validate($event)" class="form-control" :class="{'form-control-danger': errors.has('dias'), 'form-control-success': fields.dias && fields.dias.valid}" id="dias" name="dias" placeholder="{{ trans('admin.reserva.columns.dias') }}">
        <div v-if="errors.has('dias')" class="form-control-feedback form-text" v-cloak>@{{ errors.first('dias') }}</div>
    </div>
</div>


