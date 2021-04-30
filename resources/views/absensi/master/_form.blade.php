@section('styles')
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.0.6-rc.1/dist/css/select2.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-daterangepicker@3.0.3/daterangepicker.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.standalone.min.css" integrity="sha512-TQQ3J4WkE/rwojNFo6OJdyu6G8Xe9z8rMrlF9y7xpFbQfW5g8aSWcygCQ4vqRiJqFsDsE1T6MoAOMJkFXlrI9A==" crossorigin="anonymous" />
@endsection

<div class="card-body">
    <div class="card card-solid">
        <div class="card-body pb-0 pt-3">
            <blockquote>
            <b>Keterangan!!</b><br>
            <small><cite title="Source Title">Inputan Yang Ditanda Bintang Merah (<span class="text-danger">*</span>) Harus Di Isi !!</cite></small>
            </blockquote>
        </div>
    </div>
    
        <div class="form-group row">
            <label class="col-md-4 col-xs-4 col-form-label justify-flex-end">KODE ABSENSI <span class="text-danger">*</span></label> 
            <div class="col-12 col-md-5 col-lg-5">
                <input type="text" class="form-control {{ $errors->has('code') ? ' is-invalid' : '' }}" name="code" value="{{ $code ?? '' }}" readonly required />
                @if ($errors->has('code'))
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $errors->first('code') }}</strong>
                    </span>
                @endif
            </div> 
        </div> 



    <!-- periode -->
        <div class="form-group row">
            <label class="col-md-4 col-xs-4 col-form-label justify-flex-end">Periode <span class="text-danger">*</span></label> 
            <div class="col-12 col-md-5 col-lg-5">
                <select name="periode" class="form-control select2 @error('periode') is-invalid @enderror" id="" required>
                    <option value=""></option>
                    @for ($index=0; $index<=12; $index++)
                        <option value="{{ $month[$index] }}" {{ $month[$index] == old('periode', $month[date('n')] ?? '') ? 'selected' : '' }}>{{$month[$index] .', '. date('Y') }}</option>
                    @endfor
                </select>
                @error('periode')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $errors->first('periode') }}</strong>
                    </span>
                @enderror
            </div> 
        </div>

<!-- tambah departement -->
        <div class="form-group row">
            <label class="col-md-4 col-xs-4 col-form-label justify-flex-end">Departement / Lokasi Proyek <span class="text-danger">*</span></label> 
            <div class="col-12 col-md-5 col-lg-5">
                <select name="departement" class="form-control select2" id="" required>
                    <option value=""></option>
                    @foreach ($departement as $item)
                        <option value="{{ $item->id }}">{{ $item->name }}</option>
                    @endforeach
                </select>
            </div> 
        </div>

        <div class="form-group row">
            <label class="col-md-4 col-xs-4 col-form-label">TANGGAL ABSEN <span class="text-danger">*</span></label> 
            <div class="col-12 col-md-5 col-lg-5">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-white"><i class="fas fa-calendar"></i></span>
                    </div>
                    <input type="text" class="form-control pull-right datepicker{{ $errors->has('tanggal') ? ' is-invalid' : '' }}" name="tanggal" placeholder="31/04/2019" autocomplete="off" required onkeypress="return false" />
                </div>
                @if ($errors->has('tanggal'))
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $errors->first('tanggal') }}</strong>
                    </span>
                @endif
            </div> 
        </div>

    </div>
    <div class="card-footer">
        <div class="float-right">
            <div class="form-group mb-0">
                <button type="reset" class="btn btn-secondary"><i class="fas fa-undo mr-1"></i> Reset</button>
                <button type="submit" class="btn btn-primary" name="btnIn"><i class="fas fa-arrow-right mr-1"></i> Next</button> 
            </div>
        </div>
    </div>


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
@endsection