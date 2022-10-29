@extends('brackets/admin-ui::admin.layout.default')

@section('title', trans('admin.reserva.actions.edit', ['name' => $reserva->id]))

@section('body')

    <div class="container-xl">
        <div class="card">

            <reserva-form
                :action="'{{ $reserva->resource_url }}'"
                :data="{{ $reserva->toJson() }}"
                v-cloak
                inline-template>

                <form class="form-horizontal form-edit" method="post" @submit.prevent="onSubmit" :action="action" novalidate>


                    <div class="card-header">
                        <i class="fa fa-pencil"></i> {{ trans('admin.reserva.actions.edit', ['name' => $reserva->id]) }}
                    </div>

                    <div class="card-body">
                        @include('admin.reserva.components.actu')
                    </div>


                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary" :disabled="submiting">
                            <i class="fa" :class="submiting ? 'fa-spinner' : 'fa-download'"></i>
                            {{ trans('brackets/admin-ui::admin.btn.save') }}
                        </button>
                    </div>

                </form>

        </reserva-form>

        </div>

</div>

@endsection
