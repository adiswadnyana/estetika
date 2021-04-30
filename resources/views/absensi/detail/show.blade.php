@extends('layouts.app')
@section('styles')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.0.6-rc.1/dist/css/select2.min.css">
@endsection
@section('content')
    <div class="content-wrapper pb-3">
    
        <div class="content pb-5 pt-3">
              <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header bg-light">
                                <h3 class="card-title back-top" style="margin-top: 5px;">
                                    <a href="{{ route('absensi.index') }}" title="Kembali" data-toggle="tooltip" data-placement="right" class="btn text-muted">
                                        <i class="fa fa-arrow-left fa-fw"></i></span>
                                    </a>
                                </h3>
                                <div class="float-left offset-5 pt-1">
                                    <span class="d-none d-md-block d-lg-block">DAFTAR ABSENSI</span>
                                </div>
                                <div class="float-right">
                                    <form action="{{ url()->current() }}">
                                        <div class="input-group">
                                           
                                            <select name="filter" class="form-control input-sm select2">
                                                <option value="">Tampilkan semua</option>
                                                @if (!empty($filter))
                                                    <option value="all">SHOW ALL</option>
                                                @endif
                                                @foreach ($departement as $item)
                                                    <option value="{{ $item->name }}" {{ $item->name == old('filter', $filter) ? 'selected':'' }}>{{ $item->name }}</option>
                                                @endforeach
                                            </select>
                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-secondary btn-sm">Filter</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div> 
                            <div class="container-fluid row p-2" style="font-size: 14px;">
                                <div class="col-md-9 p-0">
                                    <table class="table no-border header-table mb-0" style="white-space: normal;">
                                        <tr style="line-height: 1px;">
                                            <td style="width: 100px;">Periode</td>
                                            <td style="width: 5px;">:</td>
                                            <td>{{ str_replace('-', ' - ', ucwords($absensi->periode)) }}</td>
                                        </tr>
                                        <tr style="line-height: 1px;">
                                            <td>Bulan Ke</td>
                                            <td>:</td>
                                            <td>{{ $absensi->bulan_ke }}</td>
                                        </tr>
                                        <tr>
                                            
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="table-responsive pl-2 pr-2">
                                <table class="table table-bordered mb-2 mr-2" style="font-size: 14px;">
                                    <tbody>
                                        <tr class="text-center bg-light" style="font-weight: bold;line-height: 1;">
                                            <td colspan="4" style="vertical-align : middle;width: 10px;">KEAHLIAN</td>
                                            @if (count($attendance_date) > 0)
                                                <td colspan="{{ count($attendance_date) }}" style="vertical-align : middle;white-space:normal;
                                                width: auto;
                                                height: auto;
                                                word-wrap: break-word;">TANGGAL ABSEN</td>
                                            @endif
                                            <td rowspan="2" style="vertical-align : middle;">Total Kehadiran</td>
                                        </tr>
                                        <tr class="text-center bg-light" style="line-height: 0.2;">
                                            <td style="width:5px;">NO.</td>
                                            <td>Nama</td>
                                            <td>Posisi</td>
                                            <td>Departement</td>
                                            
                                            @foreach ($attendance_date as $d)
                                                <td class="count_date_absen" style="width:20px;">{{ date('d', strtotime($d->tanggal_absen)) }}</td>
                                            @endforeach
                                        </tr>
                                            @php
                                                $grand_total = 0;
                                            @endphp

                                            @forelse ($salarys as $salary)
                                            <tr style="line-height: 0.2;">
                                                <td class="text-center">{{ $loop->iteration }}</td>
                                                <td>{{ $salary->staff->name }}</td>
                                                <td>{{ $salary->staff->position->name }}</td>
                                                <td>{{ $salary->staff->departement->name }}</td>
                                                @php
                                                    $sum_kehadiran = 0;
                                                    $sum_jam = 0;
                                                    $grand_hari = 0;
                                                    $grand_lembur = 0;
                                                    $count_absen_staff = $salary->absensi->where('periode', $absensi->periode)->count();
                                                @endphp
                                                
                                                @forelse ($salary->absensi->where('periode', $absensi->periode) as $item)
                                                    @if ($loop->first)
                                                        @if (count($attendance_date) != $count_absen_staff)
                                                            <td colspan="{{ intval(count($attendance_date)) - intval($count_absen_staff) }}"><hr class="p-0 m-0 label-danger"></td>
                                                        @endif 
                                                    @endif

                                                    @if ($item->attendance_id != '')     
                                                        <td>
                                                            {!! '<span class="'.$item->attendance->label.'">'.$item->attendance->singkatan.'</span>' !!}
                                                        </td>
                                                    @else
                                                        <td class="text-center" style="width:20px;"><i class="fa fa-remove text-danger" style="line-height: 0.2;"></i></td>
                                                    @endif
                                                    @php
                                                        $sum_jam += $item->jumlah_lembur;
                                                        $sum_kehadiran +=  $item->attendance->value;
                                                        $grand_hari = $sum_kehadiran * $salary->salary;
                                                        $grand_lembur = $sum_jam * $salary->uang_overtime;
                                                    @endphp

                                                @empty
                                                @endforelse

                                                @php
                                                    $total = $grand_hari + $grand_lembur;
                                                    $grand_total += $total;
                                                @endphp
                                                @if ($sum_kehadiran == 0)
                                                    <td class="not_absen text-center">-</td>
                                                @endif
                                                <td style="vertical-align: middle; text-align: center;">{{ $sum_kehadiran }}</td>
                                            </tr>
                                            @empty
                                                <td class="text-center" colspan="{{ 4 + count($attendance_date) + 7}}">Tidak ada data</td>
                                            @endforelse
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer p-2">
                                <div class="text-right">
                                    @if (!empty($filter))
                                        <a href="{{ route('absensi.export.excel', [$absensi->periode, $filter]) }}" class="btn btn-success btn-sm" id="export-excel">
                                            <i class="fa fa-file-excel-o fa-fw"></i> Export Excel
                                        </a>
                                    @else
                                        <a href="{{ route('absensi.export.excel', [$absensi->periode, 'all']) }}" class="btn btn-success btn-sm" id="export-excel">
                                            <i class="fa fa-file-excel-o fa-fw"></i> Export Excel
                                        </a>
                                    @endif
                                </div>
                            </div>
                            <div id="loading"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('scripts')
<script src="https://cdn.jsdelivr.net/npm/select2@4.0.6-rc.1/dist/js/select2.min.js"></script>
@include('alert.mk-notif')
    <script>
        $('.select2').select2({
			placeholder : 'Filter Data..'
        });
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();
        });

        $('#export-excel').on("click", function () {
            $(this).addClass('disabled');
            setTimeout(RemoveClass, 1000);
        });

        function RemoveClass() {
            $('#export-excel').removeClass("disabled");
		}

        var count = $(".count_date_absen").length
        $(".not_absen").attr("colspan", count);
    </script>
@endsection