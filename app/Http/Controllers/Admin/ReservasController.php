<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Reserva\BulkDestroyReserva;
use App\Http\Requests\Admin\Reserva\DestroyReserva;
use App\Http\Requests\Admin\Reserva\IndexReserva;
use App\Http\Requests\Admin\Reserva\StoreReserva;
use App\Http\Requests\Admin\Reserva\UpdateReserva;
use App\Models\Reserva;
use Brackets\AdminListing\Facades\AdminListing;
use Exception;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Contracts\Routing\ResponseFactory;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Response;
use Illuminate\Routing\Redirector;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;
use App\Models\Categoriahabitacion;

class ReservasController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @param IndexReserva $request
     * @return array|Factory|View
     */
    public function index(IndexReserva $request)
    {
        // create and AdminListing instance for a specific model and
        $data = AdminListing::create(Reserva::class)->processRequestAndGet(
            // pass the request with params
            $request,

            // set columns to query
            ['id', 'fecha_inicio', 'fecha_fin', 'nombre_cliente', 'tipo_habitacion', 'num_habitacion', 'dias', 'valor_total'],

            // set columns to searchIn
            ['id', 'nombre_cliente', 'tipo_habitacion']
        );

        if ($request->ajax()) {
            if ($request->has('bulk')) {
                return [
                    'bulkItems' => $data->pluck('id')
                ];
            }
            return ['data' => $data];
        }

        return view('admin.reserva.index', ['data' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @throws AuthorizationException
     * @return Factory|View
     */
    public function create()
    {
        $tipos=Categoriahabitacion::all();
        $this->authorize('admin.reserva.create');
        
        return view('admin.reserva.create',compact('tipos'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreReserva $request
     * @return array|RedirectResponse|Redirector
     */
    public function store(StoreReserva $request)
    {
        // Sanitize input
        $sanitized = $request->getSanitized();

        // Store the Reserva
        $reserva = Reserva::create($sanitized);

        if ($request->ajax()) {
            return ['redirect' => url('admin/reservas'), 'message' => trans('brackets/admin-ui::admin.operation.succeeded')];
        }

        return redirect('admin/reservas');
    }

    /**
     * Display the specified resource.
     *
     * @param Reserva $reserva
     * @throws AuthorizationException
     * @return void
     */
    public function show(Reserva $reserva)
    {
        $this->authorize('admin.reserva.show', $reserva);

        // TODO your code goes here
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Reserva $reserva
     * @throws AuthorizationException
     * @return Factory|View
     */
    public function edit(Reserva $reserva)
    {
        $this->authorize('admin.reserva.edit', $reserva);


        return view('admin.reserva.edit', [
            'reserva' => $reserva,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param UpdateReserva $request
     * @param Reserva $reserva
     * @return array|RedirectResponse|Redirector
     */
    public function update(UpdateReserva $request, Reserva $reserva)
    {
        // Sanitize input
        $sanitized = $request->getSanitized();

        // Update changed values Reserva
        $reserva->update($sanitized);

        if ($request->ajax()) {
            return [
                'redirect' => url('admin/reservas'),
                'message' => trans('brackets/admin-ui::admin.operation.succeeded'),
            ];
        }

        return redirect('admin/reservas');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param DestroyReserva $request
     * @param Reserva $reserva
     * @throws Exception
     * @return ResponseFactory|RedirectResponse|Response
     */
    public function destroy(DestroyReserva $request, Reserva $reserva)
    {
        $reserva->delete();

        if ($request->ajax()) {
            return response(['message' => trans('brackets/admin-ui::admin.operation.succeeded')]);
        }

        return redirect()->back();
    }

    /**
     * Remove the specified resources from storage.
     *
     * @param BulkDestroyReserva $request
     * @throws Exception
     * @return Response|bool
     */
    public function bulkDestroy(BulkDestroyReserva $request) : Response
    {
        DB::transaction(static function () use ($request) {
            collect($request->data['ids'])
                ->chunk(1000)
                ->each(static function ($bulkChunk) {
                    Reserva::whereIn('id', $bulkChunk)->delete();

                    // TODO your code goes here
                });
        });

        return response(['message' => trans('brackets/admin-ui::admin.operation.succeeded')]);
    }
}
