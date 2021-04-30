<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Salary;
use App\Models\Master\Staff;
use App\Models\Absensi;
use DB;

class SalaryController extends Controller
{
    public function index()
    {
        $data['salary'] = Salary::all();
        $data['count'] = Salary::count();
        return view('salary.index', $data);
    }

    public function create()
    {
        $data['title'] = "Buat Salary";
        $data['staff'] = Staff::all();
        return view('salary.create', $data);
    }

    public function store(Request $request)
    {   
        $request->merge([
            'tgl_salary' => date('Y-m-d', strtotime($request->tgl_salary)),
            'salary' => preg_replace('/\D/', '', $request->salary),
            'uang_overtime' => preg_replace('/\D/', '', $request->uang_overtime),
            'pot_bpjs' => preg_replace('/\D/', '', $request->pot_bpjs),
        ]);
        $request->validate([
            'staff_id'=>'required|unique:tb_salary',
            'salary'=>'required|max:20',
            'uang_overtime'=>'required|max:20',
            'pot_bpjs'=>'nullable|max:13',
            'tgl_salary'=>'required',
        ]);

        Salary::create($request->all());

        $message = [
            'alert-type'=>'success',
            'message'=> 'Data salary created successfully'
        ];  
        return redirect()->route('salary.index')->with($message);
    }

    public function edit(Salary $salary)
    {
        $data['title'] = "Edit Salary";
        $data['staff'] = Staff::all();
        $data['salary'] = $salary;
        return view('salary.edit', $data);
    }

    public function update(Request $request, Salary $salary)
    {
        $staff_id_new = '|unique:tb_salary';
        if($salary->staff_id == $request->staff_id)
        {
            $staff_id_new = '';
        }

        $request->merge([
            'tgl_salary' => date('Y-m-d', strtotime($request->tgl_salary)),
            'salary' => preg_replace('/\D/', '', $request->salary),
            'uang_overtime' => preg_replace('/\D/', '', $request->uang_overtime),
            'pot_bpjs' => preg_replace('/\D/', '', $request->pot_bpjs),
        ]);

        $request->validate([
            'staff_id'=>'required'.$staff_id_new,
            'salary'=>'required|max:20',
            'uang_overtime'=>'required|max:20',
            'pot_bpjs'=>'nullable|max:13',
            'tgl_salary'=>'required',
        ]);

        $salary->update($request->all());

        $message = [
            'alert-type'=>'success',
            'message'=> 'Data salary updated successfully'
        ];  
        return redirect()->route('salary.index')->with($message);
    }

    public function destroy(Request $request)
    {
        $id = $request->id;
        if($id)
        {   
            $salary = Salary::find($id);
            if($salary)
            {
                $salary->delete();
            }
            $count = Salary::count();
            $message = [
                'alert-type' => 'success',
                'count' => $count,
                'message' => 'Data salary deleted successfully.'
            ];
            return response()->json($message);
        }
    }

    public function show($id, Request $request)
    {
        // filter berdasarkan departement
        $f = $request->filter ?? null;

        $data['title'] = "Detail Staff Salary";
        $data['salary'] = Salary::find($id);
        $data['periode']  = Absensi::groupBy( 'periode' )
                                ->orderBy( 'tanggal_absen')
                                ->select(DB::raw('count(*) as count, periode, tanggal_absen'))
                                ->whereYear('tanggal_absen', '=', date('Y'))
                                ->get();

        if ($f == '' || $f == 'all') {
            $data['salarys'] = Absensi::where('salary_id', $id)->orderBy('periode', 'desc')->get();
        }
        else
        {
            $data['salarys'] = Absensi::where('salary_id', $id)
                                        ->where('periode', $f)
                                        ->orderBy('periode', 'desc')
                                        ->get();
        }
        $data['filter'] = $f;
        return view('salary.show', $data);      
    }

    public function excel($id, $filter)
    {
         // filter berdasarkan departement
         $f = $request->filter ?? null;

         $data['title'] = "Detail Staff Salary";
         $data['salary'] = Salary::find($id);
         $data['periode']  = Absensi::groupBy( 'periode' )
                                 ->orderBy( 'tanggal_absen')
                                 ->select(DB::raw('count(*) as count, periode, tanggal_absen'))
                                 ->whereYear('tanggal_absen', '=', date('Y'))
                                 ->get();
 
         if ($f == '' || $f == 'all') {
             $data['salarys'] = Absensi::where('salary_id', $id)->orderBy('periode', 'desc')->get();
         }
         else
         {
             $data['salarys'] = Absensi::where('salary_id', $id)
                                         ->where('periode', $f)
                                         ->orderBy('periode', 'desc')
                                         ->get();
         }
         $data['filter'] = $f;
        return view('salary.excel', $data);
    }

}
