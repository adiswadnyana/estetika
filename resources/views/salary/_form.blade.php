<div class="card-body">
    <div class="card card-solid">
        <div class="card-body pb-0 pt-3">
            <blockquote>
            <b>Keterangan!!</b><br>
            <small><cite title="Source Title">Inputan Yang Ditanda Bintang Merah (<span class="text-danger">*</span>) Harus Di Isi !!</cite></small>
            </blockquote>
        </div>
    </div>
    <div class="card-header with-border pl-0 pb-1">
        <span class="col-form-label text-bold">Salary</span>
    </div>
    <br> 
    <div class="form-group row">
        <label class="col-md-4 col-xs-4 col-form-label justify-flex-end">Staff <span class="text-danger">*</span></label> 
        <div class="col-12 col-md-5 col-lg-5">
            <select name="staff_id" class="form-control select2 @error('staff_id') is-invalid @enderror">
                <option value=""></option>
                @foreach ($staff as $item)
                    <option value="{{ $item->id }}" {{ $item->id == old('staff_id', $salary->staff_id ?? '') ? 'selected' : '' }}>{{ $item->name }}</option>
                @endforeach
            </select>
            @error('staff_id')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $errors->first('staff_id') }}</strong>
                </span>
            @enderror
        </div> 
    </div>

    <div class="form-group row">
        <label class="col-md-4 col-xs-4 col-form-label justify-flex-end">Gaji Hari<span class="text-danger">*</span></label> 
        <div class="col-12 col-md-5 col-lg-5">
            <input type="text" name="salary" class="form-control @error('salary') is-invalid @enderror" value="{{ old('salary', $salary->salary ?? '') }}" oninput="format(this)" autocomplete="off" placeholder="Rp. 0">
            @error('salary')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $errors->first('salary') }}</strong>
                </span>
            @enderror
        </div> 
    </div>

    <div class="form-group row">
        <label class="col-md-4 col-xs-4 col-form-label justify-flex-end">Gaji Lembur Perjam<span class="text-danger">*</span></label> 
        <div class="col-12 col-md-5 col-lg-5">
            <input type="text" name="uang_overtime" class="form-control @error('uang_overtime') is-invalid @enderror" value="{{ old('uang_overtime', $salary->uang_overtime ?? '') }}" oninput="format(this)" autocomplete="off" placeholder="Rp. 0">
            @error('uang_overtime')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $errors->first('uang_overtime') }}</strong>
                </span>
            @enderror
        </div> 
    </div>

    <div class="form-group row">
        <label class="col-md-4 col-xs-4 col-form-label justify-flex-end">Pot BPJS / Bulan <span class="text-danger">*</span></label> 
        <div class="col-12 col-md-5 col-lg-5">
            <input type="text" name="pot_bpjs" class="form-control @error('pot_bpjs') is-invalid @enderror" value="{{ old('uang_overtime', $salary->uang_overtime ?? '') }}" oninput="format(this)" autocomplete="off" placeholder="Rp. 0">
            @error('pot_bpjs')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $errors->first('pot_bpjs') }}</strong>
                </span>
            @enderror
        </div> 
    </div>

    <div class="form-group row">
        <label class="col-md-4 col-xs-4 col-form-label justify-flex-end">Tgl. Gaji <span class="text-danger">*</span></label> 
        <div class="col-12 col-md-5 col-lg-5">
            <input type="date" name="tgl_salary" class="form-control @error('tgl_salary') is-invalid @enderror" value="{{ old('tgl_salary', $salary->tgl_salary ?? '') }}" autocomplete="off">
            @error('tgl_salary')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $errors->first('tgl_salary') }}</strong>
                </span>
            @enderror
        </div> 
    </div>
</div>
<div class="card-footer">
    <div class="offset-md-4">
        <div class="form-group mb-0">
            <button type="submit" class="btn btn-primary mr-1"><i class="fas fa-check-double mr-1"></i> Simpan</button> 
            <button type="reset" class="btn btn-secondary"><i class="fas fa-undo mr-1"></i> Reset</button>
        </div>
    </div>
</div>