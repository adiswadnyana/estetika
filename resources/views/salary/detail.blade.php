@extends('layouts.app')
@section('styles')
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.0.6-rc.1/dist/css/select2.min.css">
    {{-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-daterangepicker@3.0.3/daterangepicker.css"> --}}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.standalone.min.css" integrity="sha512-TQQ3J4WkE/rwojNFo6OJdyu6G8Xe9z8rMrlF9y7xpFbQfW5g8aSWcygCQ4vqRiJqFsDsE1T6MoAOMJkFXlrI9A==" crossorigin="anonymous" />
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
                                    <i class="fas fa-chevron-circle-left"></i></span>
                                </a>
                            </h3>
                            <div class="float-left offset-5 pt-1">
                                    <span class="d-none d-md-block d-lg-block">{{ $title ?? '' }}</span>
                                </div>
                                <div class="float-right row">
                            <form action="{{ url()->current() }}">
                                    <div class="input-group">
                                        <select name="filter" class="form-control input-sm select3">
                                            <option value="">Tampilkan semua</option>
                                            @if (!empty($filter))
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
                        <div class="table-responsive pl-2 pr-2">
                                <table class="table table-bordered mb-2 mr-2" style="font-size: 14px;">
                                    <thead>
                                        <tr class="bg-light">
                                            <th>Periode</th>
                                            <th>Nama</th>
                                            <th>Salary</th>
                                            <th>Tgl. Salary</th>
                                            <th>Status</th>
                                            <th>Lembur</th>
                                            <th>Gaji Lembur</th>
                                            <th>BPJS</th>
                                            <th>Transportasi</th>
                                            <th>Total Gaji</th>
                                        </tr>
                                    </thead>
                                    @foreach ($salary as $item)
                                    <tbody>
                                        <tr></tr>
                                            <td>{{ ucwords($item->periode) }}</td>
                                            <td>{{ $item->staff->name }}</td>
                                            <td>{{ 'Rp. ' . number_format($item->staff->position->salary ?? '', 0, ',', '.') }} {{ $item->staff->position->status == 'Staff' ? '/ Bln' : '/ Hari' }}</td> 
                                            <td>{{ $item->tgl_salary }}</td>
                                            <td>
                                                <span class="badge {{ $item->status == 'Staff' ? 'badge-success' : 'badge-primary' }}">{{ $item->status ?? 'Outsourcing' }}</span>
                                            </td>
                                            <td>{{ $item->jumlah_overtime }} Jam</td>
                                            <td>Rp. {{ number_format($item->uang_overtime, 0, ',', '.') }} / Jam</td>
                                            <td>Rp. {{ number_format($item->pot_bpjs, 0, ',', '.') }}</td>
                                            <td>Rp. {{ number_format($item->transportasi, 0, ',', '.') }}</td>
                                            <td class="font-weight-bold">Rp. {{ number_format($item->total, 0, ',', '.') }}</td>
                                        <tr></tr>
                                    </tbody>
                                    @endforeach
                                </table>
                            </div>
                            <div class="card-footer p-2">
                            @if (!empty($filter))
                                        <a href="{{ route('salary.export.excelpayroll', [$filter]) }}" class="btn btn-success btn-sm" id="export-excel">
                                            <i class="fa fa-file-excel-o fa-fw"></i> Export Excel
                                        </a>
                                    @else
                                        <a href="{{ route('salary.export.excelpayroll', ['all']) }}" class="btn btn-success btn-sm" id="export-excel">
                                            <i class="fa fa-file-excel-o fa-fw"></i> Export Excel
                                        </a>
                                    @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        
@endsection
@section('scripts')
<script src="https://cdn.jsdelivr.net/npm/select2@4.0.6-rc.1/dist/js/select2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.id.min.js" integrity="sha512-zHDWtKP91CHnvBDpPpfLo9UsuMa02/WgXDYcnFp5DFs8lQvhCe2tx56h2l7SqKs/+yQCx4W++hZ/ABg8t3KH/Q==" crossorigin="anonymous"></script>
<script>
    	$('.select3').select3({
			placeholder : 'Pilih Periode..'
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
     
        $(function() {
            $('.datepicker').datepicker({
                    language: 'id',
                    format: 'MM-yyyy',
                    viewMode: "months", 
                    minViewMode: "months",
                    autoClose:true,
                });
            });
        
	</script>
@endsection
        