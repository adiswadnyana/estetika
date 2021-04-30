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
                                    <a href="{{ route('salary.index') }}" title="Kembali" data-toggle="tooltip" data-placement="right" class="btn text-muted">
                                        <i class="fa fa-arrow-left fa-fw"></i></span>
                                    </a>
                                </h3>
                                <div class="float-left offset-5 pt-1">
                                    <span class="d-none d-md-block d-lg-block">{{ $title ?? '' }}</span>
                                </div>
                                <div class="float-right">
                                    <form action="{{ url()->current() }}">
                                        <div class="input-group">
                                            <select name="filter" class="form-control input-sm select2">
                                                <option value="">Tampilkan semua</option>
                                                @if (!empty($filter))
                                                    <option value="all">SHOW ALL</option>
                                                @endif
                                                @foreach ($periode as $item)
                                                    <option value="{{ $item->periode }}" {{ $item->periode == old('filter', $filter) ? 'selected':'' }}>{{ strtoupper($item->periode) }}</option>
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
                                    <table class="table no-border header-table mb-0" style="">
                                        <tr style="line-height: 1px;">
                                            <td>Staff Name</td>
                                            <td>:</td>
                                            <td>{{ $salary->staff->name }}</td>
                                        </tr>
                                        <tr style="line-height: 1px;">
                                            <td>Salary/Day</td>
                                            <td>:</td>
                                            <td>{{ number_format($salary->salary, 0, ',', '.') }}</td>
                                        </tr>
                                        <tr style="line-height: 1px;">
                                            <td>Overtime/Hours</td>
                                            <td>:</td>
                                            <td>{{ number_format($salary->uang_overtime, 0, ',', '.') }}</td>
                                        </tr>
                                        <tr style="line-height: 1px;">
                                            <td>POT BPJS/Month</td>
                                            <td>:</td>
                                            <td>{{ number_format($salary->pot_bpjs, 0, ',', '.') }}</td>
                                        </tr>
                                        <tr style="line-height: 1px;">
                                            <td style="width: 100px;">Periode Salary</td>
                                            <td style="width: 5px;">:</td>
                                            <td>{{ ucwords($filter ?? 'All') }}</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="table-responsive pl-2 pr-2">
                                <table class="table table-bordered mb-2 mr-2" style="font-size: 14px;">
                                    <thead>
                                        <tr class="bg-light">
                                            <th>Tgl. Absen</th>
                                            <th>Status</th>
                                            <th>Value</th>
                                            <th>Lembur/Jam</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @php
                                            $sum_kehadiran = 0;
                                            $sum_jam = 0;
                                            $total_hari = 0;
                                            $total_lembur = 0;
                                            $grand_total = 0;
                                            $grand_total_all = 0;
                                        @endphp
                                        @forelse ($salarys as $item)
                                            @php
                                                $sum_jam += $item->jumlah_lembur;
                                                $sum_kehadiran +=  $item->attendance->value;
                                                $total_hari = $item->attendance->value * $salary->salary;
                                                $total_lembur = $item->jumlah_lembur * $salary->uang_overtime;
                                                $total = $total_hari + $total_lembur;
                                            @endphp
                                            <tr style="line-height: 1;">
                                                <td>{{ date('d M Y', strtotime($item->tanggal_absen)) }}</td>
                                                <td>
                                                    {!! '<span class="'.$item->attendance->label.'">'.$item->attendance->name.'</span>' !!}
                                                </td>
                                                <td>{{ $item->attendance->value }}</td>
                                                <td>{{ $item->jumlah_lembur }}</td>
                                                <td>Rp. {{ number_format($total, 0, ',', '.') }}</td>
                                            </tr>
                                            
                                            @php
                                                $total = $total_hari + $total_lembur;
                                                $grand_total += $total;
                                                $grand_total_all = $grand_total + $salary->pot_bpjs;
                                            @endphp
                                        @empty
                                            <tr>
                                                <td class="text-center" colspan="5">Tidak ada data untuk ditampilkan</td>
                                            </tr>
                                        @endforelse
                                        <tr class="text-bold">
                                           <td colspan="2">Grand Total Gaji <span class="float-right">POT BPJS : {{ $salary->pot_bpjs }}</span></td>
                                           <td>{{ $sum_kehadiran }} x {{ number_format($salary->salary, 0, ',', '.') }}</td>
                                           <td>{{ $sum_jam }}  x {{ number_format($salary->uang_overtime, 0, ',', '.') }}</td>
                                           <td>Rp. {{ number_format($grand_total_all, 0, ',', '.') }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer p-2">
                                <div class="text-right">
                                    @if (!empty($filter))
                                        <a href="{{ route('salary.export.excel', [$salary->id, $filter]) }}" class="btn btn-success btn-sm" id="export-excel">
                                            <i class="fa fa-file-excel-o fa-fw"></i> Export Excel
                                        </a>
                                    @else
                                        <a href="{{ route('salary.export.excel', [$salary->id, 'all']) }}" class="btn btn-success btn-sm" id="export-excel">
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
			placeholder : 'Periode..'
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
    </script>
@endsection