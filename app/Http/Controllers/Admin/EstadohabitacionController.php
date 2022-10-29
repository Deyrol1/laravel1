<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Estadohabitacion\BulkDestroyEstadohabitacion;
use App\Http\Requests\Admin\Estadohabitacion\DestroyEstadohabitacion;
use App\Http\Requests\Admin\Estadohabitacion\IndexEstadohabitacion;
use App\Http\Requests\Admin\Estadohabitacion\StoreEstadohabitacion;
use App\Http\Requests\Admin\Estadohabitacion\UpdateEstadohabitacion;
use App\Models\Estadohabitacion;
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

class EstadohabitacionController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @param IndexEstadohabitacion $request
     * @return array|Factory|View
     */
    public function index(IndexEstadohabitacion $request)
    {
        // create and AdminListing instance for a specific model and
        $data = AdminListing::create(Estadohabitacion::class)->processRequestAndGet(
            // pass the request with params
            $request,

            // set columns to query
            ['id', 'estado'],

            // set columns to searchIn
            ['id', 'estado']
        );

        if ($request->ajax()) {
            if ($request->has('bulk')) {
                return [
                    'bulkItems' => $data->pluck('id')
                ];
            }
            return ['data' => $data];
        }

        return view('admin.estadohabitacion.index', ['data' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @throws AuthorizationException
     * @return Factory|View
     */
    public function create()
    {
        $this->authorize('admin.estadohabitacion.create');

        return view('admin.estadohabitacion.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreEstadohabitacion $request
     * @return array|RedirectResponse|Redirector
     */
    public function store(StoreEstadohabitacion $request)
    {
        // Sanitize input
        $sanitized = $request->getSanitized();

        // Store the Estadohabitacion
        $estadohabitacion = Estadohabitacion::create($sanitized);

        if ($request->ajax()) {
            return ['redirect' => url('admin/estadohabitacions'), 'message' => trans('brackets/admin-ui::admin.operation.succeeded')];
        }

        return redirect('admin/estadohabitacions');
    }

    /**
     * Display the specified resource.
     *
     * @param Estadohabitacion $estadohabitacion
     * @throws AuthorizationException
     * @return void
     */
    public function show(Estadohabitacion $estadohabitacion)
    {
        $this->authorize('admin.estadohabitacion.show', $estadohabitacion);

        // TODO your code goes here
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Estadohabitacion $estadohabitacion
     * @throws AuthorizationException
     * @return Factory|View
     */
    public function edit(Estadohabitacion $estadohabitacion)
    {
        $this->authorize('admin.estadohabitacion.edit', $estadohabitacion);


        return view('admin.estadohabitacion.edit', [
            'estadohabitacion' => $estadohabitacion,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param UpdateEstadohabitacion $request
     * @param Estadohabitacion $estadohabitacion
     * @return array|RedirectResponse|Redirector
     */
    public function update(UpdateEstadohabitacion $request, Estadohabitacion $estadohabitacion)
    {
        // Sanitize input
        $sanitized = $request->getSanitized();

        // Update changed values Estadohabitacion
        $estadohabitacion->update($sanitized);

        if ($request->ajax()) {
            return [
                'redirect' => url('admin/estadohabitacions'),
                'message' => trans('brackets/admin-ui::admin.operation.succeeded'),
            ];
        }

        return redirect('admin/estadohabitacions');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param DestroyEstadohabitacion $request
     * @param Estadohabitacion $estadohabitacion
     * @throws Exception
     * @return ResponseFactory|RedirectResponse|Response
     */
    public function destroy(DestroyEstadohabitacion $request, Estadohabitacion $estadohabitacion)
    {
        $estadohabitacion->delete();

        if ($request->ajax()) {
            return response(['message' => trans('brackets/admin-ui::admin.operation.succeeded')]);
        }

        return redirect()->back();
    }

    /**
     * Remove the specified resources from storage.
     *
     * @param BulkDestroyEstadohabitacion $request
     * @throws Exception
     * @return Response|bool
     */
    public function bulkDestroy(BulkDestroyEstadohabitacion $request) : Response
    {
        DB::transaction(static function () use ($request) {
            collect($request->data['ids'])
                ->chunk(1000)
                ->each(static function ($bulkChunk) {
                    Estadohabitacion::whereIn('id', $bulkChunk)->delete();

                    // TODO your code goes here
                });
        });

        return response(['message' => trans('brackets/admin-ui::admin.operation.succeeded')]);
    }
}
