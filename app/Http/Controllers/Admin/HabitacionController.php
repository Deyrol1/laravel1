<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Habitacion\BulkDestroyHabitacion;
use App\Http\Requests\Admin\Habitacion\DestroyHabitacion;
use App\Http\Requests\Admin\Habitacion\IndexHabitacion;
use App\Http\Requests\Admin\Habitacion\StoreHabitacion;
use App\Http\Requests\Admin\Habitacion\UpdateHabitacion;
use App\Models\Habitacion;
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
use App\Models\Estadohabitacion;
class HabitacionController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @param IndexHabitacion $request
     * @return array|Factory|View
     */
    public function index(IndexHabitacion $request)
    {
        // create and AdminListing instance for a specific model and
        $data = AdminListing::create(Habitacion::class)->processRequestAndGet(
            // pass the request with params
            $request,

            // set columns to query
            ['id', 'numero', 'tipo', 'costo', 'estado'],

            // set columns to searchIn
            ['id', 'numero', 'tipo', 'estado']
        );

        if ($request->ajax()) {
            if ($request->has('bulk')) {
                return [
                    'bulkItems' => $data->pluck('id')
                ];
            }
            return ['data' => $data];
        }

        return view('admin.habitacion.index', ['data' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @throws AuthorizationException
     * @return Factory|View
     */
    public function create()
    {
        $this->authorize('admin.habitacion.create');

        $tipos=Categoriahabitacion::all();
        $estados=Estadohabitacion::all();
        

        return view('admin.habitacion.create',compact('tipos'),compact('estados'));
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param StoreHabitacion $request
     * @return array|RedirectResponse|Redirector
     */
    public function store(StoreHabitacion $request)
    {
        // Sanitize input
        $sanitized = $request->getSanitized();

        // Store the Habitacion
        $habitacion = Habitacion::create($sanitized);

        if ($request->ajax()) {
            return ['redirect' => url('admin/habitacions'), 'message' => trans('brackets/admin-ui::admin.operation.succeeded')];
        }

        return redirect('admin/habitacions');
    }

    /**
     * Display the specified resource.
     *
     * @param Habitacion $habitacion
     * @throws AuthorizationException
     * @return void
     */
    public function show(Habitacion $habitacion)
    {
        $this->authorize('admin.habitacion.show', $habitacion);

        // TODO your code goes here
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Habitacion $habitacion
     * @throws AuthorizationException
     * @return Factory|View
     */
    public function edit(Habitacion $habitacion)
    {
        $this->authorize('admin.habitacion.edit', $habitacion);
        $tipos=Categoriahabitacion::all();
        $estados=Estadohabitacion::all();


        return view('admin.habitacion.edit', [
            'habitacion' => $habitacion,compact('tipos'),compact('estados')
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param UpdateHabitacion $request
     * @param Habitacion $habitacion
     * @return array|RedirectResponse|Redirector
     */
    public function update(UpdateHabitacion $request, Habitacion $habitacion)
    {
        // Sanitize input
        $sanitized = $request->getSanitized();

        // Update changed values Habitacion
        $habitacion->update($sanitized);

        if ($request->ajax()) {
            return [
                'redirect' => url('admin/habitacions'),
                'message' => trans('brackets/admin-ui::admin.operation.succeeded'),
            ];
        }

        return redirect('admin/habitacions');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param DestroyHabitacion $request
     * @param Habitacion $habitacion
     * @throws Exception
     * @return ResponseFactory|RedirectResponse|Response
     */
    public function destroy(DestroyHabitacion $request, Habitacion $habitacion)
    {
        $habitacion->delete();

        if ($request->ajax()) {
            return response(['message' => trans('brackets/admin-ui::admin.operation.succeeded')]);
        }

        return redirect()->back();
    }

    /**
     * Remove the specified resources from storage.
     *
     * @param BulkDestroyHabitacion $request
     * @throws Exception
     * @return Response|bool
     */
    public function bulkDestroy(BulkDestroyHabitacion $request) : Response
    {
        DB::transaction(static function () use ($request) {
            collect($request->data['ids'])
                ->chunk(1000)
                ->each(static function ($bulkChunk) {
                    Habitacion::whereIn('id', $bulkChunk)->delete();

                    // TODO your code goes here
                });
        });

        return response(['message' => trans('brackets/admin-ui::admin.operation.succeeded')]);
    }
}
