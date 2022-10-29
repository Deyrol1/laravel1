<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Categoriahabitacion\BulkDestroyCategoriahabitacion;
use App\Http\Requests\Admin\Categoriahabitacion\DestroyCategoriahabitacion;
use App\Http\Requests\Admin\Categoriahabitacion\IndexCategoriahabitacion;
use App\Http\Requests\Admin\Categoriahabitacion\StoreCategoriahabitacion;
use App\Http\Requests\Admin\Categoriahabitacion\UpdateCategoriahabitacion;
use App\Models\Categoriahabitacion;
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

class CategoriahabitacionController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @param IndexCategoriahabitacion $request
     * @return array|Factory|View
     */
    public function index(IndexCategoriahabitacion $request)
    {
        // create and AdminListing instance for a specific model and
        $data = AdminListing::create(Categoriahabitacion::class)->processRequestAndGet(
            // pass the request with params
            $request,

            // set columns to query
            ['id', 'categoria', 'valor'],

            // set columns to searchIn
            ['id', 'categoria']
        );

        if ($request->ajax()) {
            if ($request->has('bulk')) {
                return [
                    'bulkItems' => $data->pluck('id')
                ];
            }
            return ['data' => $data];
        }

        return view('admin.categoriahabitacion.index', ['data' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @throws AuthorizationException
     * @return Factory|View
     */
    public function create()
    {
        $this->authorize('admin.categoriahabitacion.create');

        return view('admin.categoriahabitacion.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreCategoriahabitacion $request
     * @return array|RedirectResponse|Redirector
     */
    public function store(StoreCategoriahabitacion $request)
    {
        // Sanitize input
        $sanitized = $request->getSanitized();

        // Store the Categoriahabitacion
        $categoriahabitacion = Categoriahabitacion::create($sanitized);

        if ($request->ajax()) {
            return ['redirect' => url('admin/categoriahabitacions'), 'message' => trans('brackets/admin-ui::admin.operation.succeeded')];
        }

        return redirect('admin/categoriahabitacions');
    }

    /**
     * Display the specified resource.
     *
     * @param Categoriahabitacion $categoriahabitacion
     * @throws AuthorizationException
     * @return void
     */
    public function show(Categoriahabitacion $categoriahabitacion)
    {
        $this->authorize('admin.categoriahabitacion.show', $categoriahabitacion);

        // TODO your code goes here
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Categoriahabitacion $categoriahabitacion
     * @throws AuthorizationException
     * @return Factory|View
     */
    public function edit(Categoriahabitacion $categoriahabitacion)
    {
        $this->authorize('admin.categoriahabitacion.edit', $categoriahabitacion);


        return view('admin.categoriahabitacion.edit', [
            'categoriahabitacion' => $categoriahabitacion,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param UpdateCategoriahabitacion $request
     * @param Categoriahabitacion $categoriahabitacion
     * @return array|RedirectResponse|Redirector
     */
    public function update(UpdateCategoriahabitacion $request, Categoriahabitacion $categoriahabitacion)
    {
        // Sanitize input
        $sanitized = $request->getSanitized();

        // Update changed values Categoriahabitacion
        $categoriahabitacion->update($sanitized);

        if ($request->ajax()) {
            return [
                'redirect' => url('admin/categoriahabitacions'),
                'message' => trans('brackets/admin-ui::admin.operation.succeeded'),
            ];
        }

        return redirect('admin/categoriahabitacions');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param DestroyCategoriahabitacion $request
     * @param Categoriahabitacion $categoriahabitacion
     * @throws Exception
     * @return ResponseFactory|RedirectResponse|Response
     */
    public function destroy(DestroyCategoriahabitacion $request, Categoriahabitacion $categoriahabitacion)
    {
        $categoriahabitacion->delete();

        if ($request->ajax()) {
            return response(['message' => trans('brackets/admin-ui::admin.operation.succeeded')]);
        }

        return redirect()->back();
    }

    /**
     * Remove the specified resources from storage.
     *
     * @param BulkDestroyCategoriahabitacion $request
     * @throws Exception
     * @return Response|bool
     */
    public function bulkDestroy(BulkDestroyCategoriahabitacion $request) : Response
    {
        DB::transaction(static function () use ($request) {
            collect($request->data['ids'])
                ->chunk(1000)
                ->each(static function ($bulkChunk) {
                    Categoriahabitacion::whereIn('id', $bulkChunk)->delete();

                    // TODO your code goes here
                });
        });

        return response(['message' => trans('brackets/admin-ui::admin.operation.succeeded')]);
    }
}
