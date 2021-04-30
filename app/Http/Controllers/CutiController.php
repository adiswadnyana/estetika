<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cuti;
use App\Models\Master\Staff;

class CutiController extends Controller
{
    public function index()
    {
        $data['cuti'] = Cuti::all();
        $data['count'] = Cuti::count();
        return view('cuti.index', $data);
    }

    public function create()
    {
        $data['title'] = "Buat cuti";
        $data['staff'] = Staff::all();
        return view('cuti.create', $data);
    }
    
    public function store(Request $request)
    {   
        $request->validate([
            'staff_id'=>'required',
            'jumlah_cuti'=>'required',
            'tgl_cuti'=>'required|date',
        ]);

        Cuti::create($request->all());

        $message = [
            'alert-type'=>'success',
            'message'=> 'Data cuti created successfully'
        ];  
        return redirect()->route('cuti.index')->with($message);
    }

    public function edit(cuti $cuti)
    {
        $data['title'] = "Edit cuti";
        $data['staff'] = Staff::all();
        $data['cuti'] = $cuti;
        return view('cuti.edit', $data);
    }

    public function update(Request $request, cuti $cuti)
    {
        $request->validate([
            'staff_id'=>'required',
            'jumlah_cuti'=>'required',
            'tgl_cuti'=>'required|date',
        ]);

        $cuti->update($request->all());

        $message = [
            'alert-type'=>'success',
            'message'=> 'Data cuti updated successfully'
        ];  
        return redirect()->route('cuti.index')->with($message);
    }

    public function destroy(Request $request)
    {
        $id = $request->id;
        if($id)
        {   
            $cuti = Cuti::find($id);
            if($cuti)
            {
                $cuti->delete();
            }
            $count = Cuti::count();
            $message = [
                'alert-type' => 'success',
                'count' => $count,
                'message' => 'Data cuti deleted successfully.'
            ];
            return response()->json($message);
        }
    }
}
