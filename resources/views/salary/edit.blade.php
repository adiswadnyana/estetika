@extends('layouts.app')
@section('styles')
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.0.6-rc.1/dist/css/select2.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-daterangepicker@3.0.3/daterangepicker.css">
@endsection
@section('content')

    <div class="content-wrapper pb-3 pt-3">
        <div class="content pb-5">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header bg-light">
                                <div class="text-center">
                                    <h3 class="card-title ml-3">{{ $title }}</h3>
                                </div>
                                <div class="back-top">
                                <a href="{{ url()->previous() }}" title="Kembali" data-toggle="tooltip" data-placement="right" class="btn text-muted">
                                    <i class="fas fa-chevron-circle-left"></i></span>
                                </a>
                            </div>
                            </div> 
                            <form action="" method="POST" class="form-horizontal" enctype="multipart/form-data">
                               <!-- FORM EDIT  -->
                               <div class="card-body pt-0 pl-1 pr-1 pb-0">
                                <div class="container-fluid row p-2" style="font-size: 14px;">
                                    <div class="col-md-9 p-0">
                                        <table class="table no-border header-table mb-0 mt-0" style="">
                                        <tr style="line-height: 1px;">
                                                <td width="100">Nama Karyawan</td>
                                                <td width="10">:</td>
                                                <td class="text-left">{{$salary->staff->name}}</td>
                                            </tr>
                                            <tr style="line-height: 1px;">
                                                <td width="100">Karyawan Status</td>
                                                <td width="10">:</td>
                                                <td class="text-left">
                                                    <span class="">{{ $salary->status}}</span>
                                                </td>
                                            </tr>
                                            <tr style="line-height: 1px;">
                                                <td width="100">Periode</td>
                                                <td width="10">:</td>
                                                <td class="text-left">{{$salary->periode}}</td>
                                            </tr>
                                            <tr style="line-height: 1px;">
                                                <td width="100">Salary</td>
                                                <td width="10">:</td>
                                                <td class="text-left">@currency($salary->salary) / {{ $salary->status == 'Staff' ? "Bulan" : "Hari"}}
                                                </td>
                                            </tr>
                                            <tr style="line-height: 1px;">
                                                <td width="100">Tanggal Gajian</td>
                                                <td width="10">:</td>
                                                <td class="text-left">{{$salary->tgl_salary}}</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                                <div class="table-responsive pl-2 pr-2">
                                    <table class='table table-striped table-bordered'>
                                        {{-- <tbody> --}}
                                        @if($salary->status == 'Daily Worker')
                                                <tr class="bg-white">
                                                    <td>Total Kehadiran <div class="text-right"></td>
                                                        <td class="text-right">
                                                            <input type="hidden" name="total_kehadiran" class="form-control" readonly>
                                                            <span id="total_kehadiran" class="badge badge-success">{{$attendance_date[0]->count}}</span> Hari
                                                        </td>
                                                </tr>
                                        @endif
                                            <!-- Jika Statusnya Staff  -->
                                            
                                            <tbody id="KaryawanBulanan">
                                            @if($salary->status == 'Staff')
                                            <tr>
                                                <td>Pot BPJS</td>
                                                <td style="min-width: 180px;">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">- Rp</span>
                                                        </div>
                                                        <input type="text" name="pot_bpjs" class="form-control @error('pot_bpjs') is-invalid @enderror" id="pot_bpjs"  placeholder="0" onkeypress="return hanyaAngka(this)" maxlength="8" value="{{$salary->pot_bpjs}}" autocomplete="off">
                                                    </div>
                                                    <!-- @error('pot_bpjs') -->
                                                        <span class="invalid-feedback" role="alert">
                                                            <strong>BPJS</strong>
                                                        </span>
                                                    <!-- @enderror -->
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Transportasi</td>
                                                <td>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">Rp</span>
                                                        </div>
                                                        <input type="text" name="transportasi" class="form-control @error('transportasi') is-invalid @enderror" id="transportasi" placeholder="0" value="{{$salary->pot_bpjs}}"  onkeypress="return hanyaAngka(this)" maxlength="8" autocomplete="off">
                                                    </div>
                                                    <!-- @error('transportasi') -->
                                                        <span class="invalid-feedback" role="alert">
                                                            <strong>TRANSPORTASI</strong>
                                                        </span>
                                                    <!-- @enderror -->
                                                </td>
                                            </tr>
                                            @endif
                                             <!-- end Jika Statusnya Staff  -->
                                                <tr class="bg-white">
                                                    <td>Lembur</td>
                                                    <td colspan="2">
                                                        <div class="input-group">
                                                            <input type="text" name="jam_lembur" id="jam_lembur" value="{{$salary->jumlah_overtime}}" class="form-control @error('jam_lembur') is-invalid @enderror" placeholder="masukan jumlah lembur.." autocomplete="off"  maxlength="2" min="0" onkeypress="return hanyaAngka(this)">
                                                            <div class="input-group-append">
                                                                <span class="input-group-text">Jam</span>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr style="background-color: rgba(0,0,0,.05)">
                                                    <td>Gaji Lembur / Jam</td>
                                                    <td style="min-width: 180px;">
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text">Rp</span>
                                                            </div>
                                                            <input type="text" name="gaji_lembur" id="gaji_lembur" value="{{$salary->uang_overtime}}" class="form-control" placeholder="0" autocomplete="off" maxlength="8">
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                    </table>
                                </div>
                                
                                </div>
                                <div class="card-footer">
                                    <div class="float-left">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="dibayar" name="status_gaji" value="Dibayar" class="toggle-form-dibayar" checked>
                                            <label class="form-check-label" for="dibayar">
                                                Tandai telah di gaji
                                            </label>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <div class="form-group mb-0">
                                            <a href="{{ url()->previous() }}" class="btn btn-secondary"><i class="fa fa-arrow-left"></i> Back</a>
                                            <button type="submit" class="btn btn-primary" name="submit"><i class="fas fa-check mr-1"></i> Simpan</button> 
                                        </div>
                                    </div>
                                </div>
                               <!-- FORM EDIT END  -->
                            </form>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.id.min.js" integrity="sha512-zHDWtKP91CHnvBDpPpfLo9UsuMa02/WgXDYcnFp5DFs8lQvhCe2tx56h2l7SqKs/+yQCx4W++hZ/ABg8t3KH/Q==" crossorigin="anonymous"></script>
<script>
    	$('.select2').select2({
			placeholder : 'Pilih Data..'
        });
     
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
@endsection('scripts')