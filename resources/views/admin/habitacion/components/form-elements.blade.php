
<div class="form-group row align-items-center" :class="{'has-danger': errors.has('numero'), 'has-success': fields.numero && fields.numero.valid }">
    <label for="numero" class="col-form-label text-md-right" :class="isFormLocalized ? 'col-md-4' : 'col-md-2'">{{ trans('admin.habitacion.columns.numero') }}</label>
        <div :class="isFormLocalized ? 'col-md-4' : 'col-md-9 col-xl-8'">
        <input type="text" v-model="form.numero" v-validate="'required'" @input="validate($event)" class="form-control" :class="{'form-control-danger': errors.has('numero'), 'form-control-success': fields.numero && fields.numero.valid}" id="numero" name="numero" placeholder="{{ trans('admin.habitacion.columns.numero') }}">
        <div v-if="errors.has('numero')" class="form-control-feedback form-text" v-cloak>@{{ errors.first('numero') }}</div>
    </div>
</div>

<div class="form-group row align-items-center" :class="{'has-danger': errors.has('tipo'), 'has-success': fields.tipo && fields.tipo.valid }">
    <label for="tipo" class="col-form-label text-md-right" :class="isFormLocalized ? 'col-md-4' : 'col-md-2'">{{ trans('admin.habitacion.columns.tipo') }}</label>
        <div :class="isFormLocalized ? 'col-md-4' : 'col-md-9 col-xl-8'">
        <select class="form-select form-control" aria-label="Default select example" v-model="form.tipo" v-validate="'required'" @input="validate($event)" :class="{'form-control-danger': errors.has('tipo'), 'form-control-success': fields.tipo && fields.tipo.valid}" id="tipo" name="tipo" placeholder="{{ trans('admin.habitacion.columns.numero') }}">
           @foreach ($tipos as $tipo)

                <option value="{{ $tipo['categoria'] }}">{{ $tipo['categoria'] }}-{{ $tipo['valor'] }}</option disabled>
           @endforeach
          </select>
        <div v-if="errors.has('tipo')" class="form-control-feedback form-text" v-cloak>@{{ errors.first('tipo') }}</div>
    </div>
</div>



<div class="form-group row align-items-center" :class="{'has-danger': errors.has('estado'), 'has-success': fields.estado && fields.estado.valid }">
    <label for="estado" class="col-form-label text-md-right" :class="isFormLocalized ? 'col-md-4' : 'col-md-2'">{{ trans('admin.habitacion.columns.estado') }}</label>
        <div :class="isFormLocalized ? 'col-md-4' : 'col-md-9 col-xl-8'">
        <select class="form-select form-control" aria-label="Default select example" v-model="form.estado" v-validate="'required'" @input="validate($event)" :class="{'form-control-danger': errors.has('estado'), 'form-control-success': fields.estado && fields.estado.valid}" id="estado" name="estado">
            @foreach ($estados as $estado)
                 <option value="{{ $estado['estado'] }}">{{ $estado['estado'] }}</option disabled>
            @endforeach
           </select>

        <div v-if="errors.has('estado')" class="form-control-feedback form-text" v-cloak>@{{ errors.first('estado') }}</div>
    </div>
</div>




