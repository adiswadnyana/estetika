<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Absensi;
use App\Models\Master\Staff;
use App\Models\Master\Keterangan;
use App\Models\Master\Attendance;
use App\Models\Salary;
use App\Models\Master\Departement;
use DB;
use Illuminate\Support\Facades\Input;

class AbsensiController extends Controller
{
    public function index()
    {
        $absensi = new Absensi;
        $data['absensi']  = $absensi->groupBy( 'periode' )
                                ->orderBy( 'tanggal_absen')
                                ->select(DB::raw('count(*) as count, periode, bulan_ke, tanggal_absen'))
                                ->get();
        $data['count']  =  count($data['absensi']);
        return view('absensi.master.index', $data);
    }   

    public function create()
    {
        $query = Absensi::select('code')->max('code');
        $kode_count = intval($query, 11) + 1;
        $maxkode = sprintf("%03s",$kode_count);
        $create_code = "ABSEN-KODE-".$maxkode;
        $data['code']  = $create_code;
        $data['title'] = "Create Master Absen";
        $data['month'] = array("","Januari","Februari","Maret","April","Mei","Juni","Juli", 'Agustus', 'September', 'Oktober', 'November', 'Desember');
        return view('absensi.master.create', $data);
        
    }

    public function store(Request $request)
    {
        $request->validate([
            'code'  => 'required',
            'periode'  => 'required',
            'bulan_ke'  => 'required',
            'tanggal'  => 'required',
        ]);

        $cek_staff = Staff::get();

        if (is_null($cek_staff)) {
            $data['staff'] = true;
            $data['info'] = 'disabled';
        }
        $absen_detail = new Absensi();
        $tanggal_absen = date('Y-m-d', strtotime($request->tanggal));
        $cek_double = $absen_detail->where(['tanggal_absen' => $tanggal_absen])->count();
        if ($cek_double >0 ){
            $message = [
                'alert-type' => 'error',
                'message' => 'Anda sudah absen pada tanggal '.tgl_indo($tanggal_absen).' ini, Absen lagi ditanggal berikutnya.'
            ];
            return redirect()->back()->with($message);
        }
       
        $data['title'] = "Absen Harian";
        $data['request']  = $request;
        $keterangan = new Keterangan();
        $data['attendance'] = Attendance::all();
        $data['status'] = $keterangan->status;
        $data['salary_staff'] = Salary::all();
        return view('absensi.detail.create', $data);
    }

    public function storeDetail(Request $request)
    {
        // dd($request->all());
        $a      = 0;
        if($request->salary_id)
        {
            $absensi  = $request->salary_id;
            if ($absensi[0] !== null) {
                foreach ($absensi as $row) {
                    $data = [
                        'code' => $request->code,
                        'periode'=> $request->periode,
                        'bulan_ke'=> $request->bulan_ke,
                        'tanggal_absen' => date('Y-m-d', strtotime($request->tanggal)),
                        'salary_id' => $request->salary_id[$a],
                        'jumlah_lembur' => $request->jam_lembur[$a],
                        'attendance_id'=>$request->attendance[$a],
                        'status'=>$request->status[$a],
                    ];
                    $insert = Absensi::create($data);
                    if($insert)
                    {
                        $a++;
                    }
                }
            }

            $message = [
                'alert-type' => 'success',
                'message' => 'Absensi created successfully.'
            ];
            return redirect()->route('absensi.index')->with($message);
        }
    }

    public function show($id, Request $request)
    {
        // filter berdasarkan departement
        $f = $request->filter ?? null;
        $detail_absen = new Absensi;
        $absen = $detail_absen->where('periode', $id)->first();
        if($absen)
        {
            $data['title'] = "Detail Absensi";
            if ($f == '' || $f == 'all') {
                $data['salarys'] = Salary::orderBy('a.name', 'asc')
                                    ->select(DB::raw('tb_salary.*, a.name'))
                                    ->join('tb_staff AS a', 'a.id', '=', 'tb_salary.staff_id')
                                    ->get();
            }
            else
            {
                $data['salarys'] = Salary::orderBy('a.name', 'asc')
                ->select(DB::raw('tb_salary.*, a.name'))
                ->join('tb_staff AS a', 'a.id', '=', 'tb_salary.staff_id')
                ->join('tb_departement AS b', 'b.id', '=', 'a.departement_id')
                ->where('b.name', $f)
                ->get();
            }
            $data['attendance_date']    = $detail_absen->groupBy( 'tanggal_absen' )
                                        ->orderBy( 'tanggal_absen' )
                                        ->select(DB::raw('count(*) as count, DATE( tanggal_absen ) as tanggal_absen'))
                                        ->where('periode', $id)
                                        ->get();
            $data['absensi'] = Absensi::where('periode', $id)->first();
            $data['departement'] = Departement::all();
            $data['filter'] = $f;
            return view('absensi.detail.show', $data);
        }
        else
        {
            return abort(404);
        }
    }

    public function excel($id, $filter)
    {
        // filter berdasarkan departement
        $f = $filter ?? null;
        $detail_absen = new Absensi;
        $absen = $detail_absen->where('periode', $id)->first();
        $data['title'] = "Detail Absensi";
        if ($f == '' || $f == 'all') {
            $data['salarys'] = Salary::orderBy('a.name', 'asc')
                                ->select(DB::raw('tb_salary.*, a.name'))
                                ->join('tb_staff AS a', 'a.id', '=', 'tb_salary.staff_id')
                                ->get();
        }
        else
        {

            $data['salarys'] = Salary::orderBy('a.name', 'asc')
            ->select(DB::raw('tb_salary.*, a.name'))
            ->join('tb_staff AS a', 'a.id', '=', 'tb_salary.staff_id')
            ->join('tb_departement AS b', 'b.id', '=', 'a.departement_id')
            ->where('b.name', $f)
            ->get();
        }
        $data['attendance_date']    = $detail_absen->groupBy( 'tanggal_absen' )
                                    ->orderBy( 'tanggal_absen' )
                                    ->select(DB::raw('count(*) as count, DATE( tanggal_absen ) as tanggal_absen'))
                                    ->where('periode', $id)
                                    ->get();
        $data['absensi'] = Absensi::where('periode', $id)->first();
        $data['filter'] = $f;
        return view('absensi.detail.excel', $data);
    }
}
