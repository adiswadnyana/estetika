<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Absensi;
use App\Models\Master\Staff;
use App\Models\Master\Keterangan;
use App\Models\Master\Attendance;
use App\Models\Master\Departement;
use App\Models\Salary;
use Auth;
use DB;
use Illuminate\Support\Facades\Input;

class AbsensiController extends Controller
{
    public function index()
    {
        $absensi = new Absensi;
        $data['absensi']  = $absensi->groupBy( 'periode' )
                                ->orderBy( 'tanggal_absen')
                                ->select(DB::raw('count(*) as count, periode, tanggal_absen'))
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
        $departement_id = Auth::user()->staff->departement_id;
        $role_id = Auth::user()->role_id;
        if($role_id==3){
            $data['departement'] = Departement::where('id',$departement_id)->get(); 
        }
        else {
            $data['departement'] = Departement::all();
        }
        $data['month'] = array("Januari","Februari","Maret","April","Mei","Juni","Juli", 'Agustus', 'September', 'Oktober', 'November', 'Desember');
        return view('absensi.master.create', $data);
    }

    public function store(Request $request)
    {
        // filter berdasarkan departement
        // echo "<script>console.log('req =>'$request);</script>";
        // print_r($request);
        $f = $request->filter ?? null;
        $request->validate([
            'code'  => 'required',
            'periode'  => 'required',
            'departement' => 'required',
            'tanggal'  => 'required',
        ]);

        $absen_detail = new Absensi();
        $data['absen_detail'] = $absen_detail;
        $tanggal_absen = date('Y-m-d', strtotime($request->tanggal));
        $data['periode'] = strtolower($request->periode ?? '') .'-'. date('Y', strtotime($request->tanggal));
        $data['tanggal_absen'] = $tanggal_absen;
        $cek_absen = $absen_detail->where(['tanggal_absen' => $tanggal_absen])->count();
        $data['title'] = "Absen Harian";
        $data['request']  = $request;
        $keterangan = new Keterangan();
        $data['attendance'] = Attendance::all();
        $data['status'] = $keterangan->status;
        $data['departement'] = Departement::all();
        $data['filter'] = $f;
        
        if($f == '' || $f == null) {
            $data['departementStaff'] = Staff::orderBy('tb_staff.id','asc')
                                            ->select(DB::raw('*, tb_staff.name as staffName, tb_staff.id as staffId'))
                                            ->join('tb_departement', 'tb_staff.departement_id','=','tb_departement.id')
                                            ->where('tb_staff.departement_id',$request->departement)
                                            ->get();
        } else {
            $data['departementStaff'] = Staff::orderBy('tb_staff.id','asc')
                                            ->select(DB::raw('*, tb_staff.name as staffName, tb_staff.id as staffId'))
                                            ->join('tb_departement', 'tb_staff.departement_id','=','tb_departement.id')
                                            ->where('tb_departement.name', $f)
                                            ->where('tb_staff.departement_id',$request->departement)
                                            ->get();
        }
        
        
        return view('absensi.detail.create', $data);
    }

    public function storeDetail(Request $request)
    {
        if($request->staff_id)
        {
            foreach ($request->staff_id as $key => $value) 
            {
                if( ! empty($request->staff_id[$key]))
                {
                    $data = [
                        'code' => $request->code,
                        'periode'=> $request->periode,
                        'tanggal_absen' => date('Y-m-d', strtotime($request->tanggal)),
                        'staff_id' => $request->staff_id[$key],
                        'attendance_id'=>$request->attendance[$key],
                    ];
                    $filter = array(
                        'periode' => $request->periode,
                        'staff_id' => $request->staff_id[$key],
                        'tanggal_absen' => date('Y-m-d', strtotime($request->tanggal)),
                    );
                    if (Absensi::where($filter)->count() > 0) {
                        Absensi::where($filter)->update(['attendance_id' => $request->attendance[$key]]);
                    } else {
                        Absensi::create($data);
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
        $data['detail_absen'] = $detail_absen;
        $absen = $detail_absen->where('periode', $id)->first();
        if($absen)
        {
            $data['title'] = "Detail Absensi";
            $data['attendance_date']    = $detail_absen->groupBy( 'tanggal_absen' )
                                        ->orderBy( 'tanggal_absen' )
                                        ->select(DB::raw('count(*) as count, DATE( tanggal_absen ) as tanggal_absen'))
                                        ->where('periode', $id)
                                        ->get();
            $data['absensi'] = Absensi::where('periode', $id)->first();
            if ($f == '' || $f == 'all') {
                $data['absensiStaff'] = Absensi::orderBy('tb_absensi.id', 'asc')
                                                ->where('periode', $id)
                                                ->groupBy('staff_id')
                                                ->get();
            } else {
                $data['absensiStaff'] = Absensi::orderBy('tb_absensi.id', 'asc')
                                                ->where('periode', $id)
                                                ->groupBy('staff_id')
                                                ->join('tb_staff AS a', 'a.id', '=', 'tb_absensi.staff_id')
                                                ->join('tb_departement AS b', 'b.id', '=', 'a.departement_id')
                                                ->where('b.name', $f)
                                                ->get();
            }
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
        $detail_absen->where('periode', $id)->first();
        $data['title'] = "Detail Absensi";
        $data['attendance_date']    = $detail_absen->groupBy( 'tanggal_absen' )
                                    ->orderBy( 'tanggal_absen' )
                                    ->select(DB::raw('count(*) as count, DATE( tanggal_absen ) as tanggal_absen'))
                                    ->where('periode', $id)
                                    ->get();
        $data['absensi'] = Absensi::where('periode', $id)->first();
        $data['departement'] = Departement::all();
        $data['filter'] = $f;
        return view('absensi.detail.excel', $data);
    }
}