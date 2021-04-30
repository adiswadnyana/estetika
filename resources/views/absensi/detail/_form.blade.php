<div class="card-body">
        
    @if ($staff ?? '')
        <div class="alert alert-warning text-justify">
            <strong>Warning !!</strong> Data staff belum ada, anda tidak dapat melakukan absensi. Silahkan input data staff terlebih dulu 
            <a class="float-right" href="{{ route('staff.create') }}" data-toggle="tooltip" title="Silahkan klik untuk menginput data pekerja" style="text-decoration-color: blue;">
                <span class="text-primary">Input Sekarang ?</span>  
            </a>
        </div>
    @else
        <div class="card card-solid">
            <div class="card-body pb-0 pt-3">
                <blockquote>
                    <b>Keterangan!!</b><br>
                    <small><cite title="Source Title">Inputan Yang Ditanda Bintang Merah (<span class="text-danger">*</span>) Harus Di Isi !!</cite></small>
                </blockquote>
            </div>
        </div>
    @endif
    
    <div class="row">
        <div class="col-md-12">
            <div class="card-header with-border pl-0 pb-1">
                <span class="col-form-label text-bold">Daftar Absen</span>
            </div>
            <br>
            <div class="table-responsive">
                <table class='table table-striped' id="AbsensiID">
                    <thead>
                        <tr class="bg-light">
                            <td class="text-center">#</td>
                            <td>Staff <span class="text-danger">*</span></td>
                            <td>Position <span class="text-danger">*</span></td>
                            <td>Departement <span class="text-danger">*</span></td>
                            <td>Salary / Hari</td>
                            <td>Uang Overtime</td>
                            <td style="width: 50px;">Count Overtime</td>
                            <td>Attendance</td>
                            <td>Status</td>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($salary_staff as $item)
                            <tr>
                                <input type="hidden" name="salary_id[]" class="form-control " value="{{ $item->id }}" readonly required>
                                <input type="hidden" name="staff_name[]" class="form-control" value="{{ $item->staff->name }}" readonly required>
                                <td class="text-center">{{ $loop->iteration }}</td>
                                <td>
                                    {{ $item->staff->name }}
                                </td>
                                <td>{{ $item->staff->position->name }}</td>
                                <td>{{ $item->staff->departement->name }}</td>
                                <td>{{ number_format($item->salary ??'', 0, ',', '.') }}</td>
                                <td>{{ number_format($item->uang_overtime ??'', 0, ',', '.') }}</td>
                                <td>
                                    <input type="number" name="jam_lembur[]" value="0" min="0" class="form-control" placeholder="0" required>
                                </td>
                                <td>
                                    <select name="attendance[]" class="form-control select2{{ $errors->has('attendance') ? ' is-invalid' : '' }}" required>
                                        @foreach ($attendance as $item)
                                            <option value="{{ $item->id }}" >{{ strtoupper($item->name) }}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('attendance'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('attendance') }}</strong>
                                        </span>
                                    @endif
                                </td>
                                <td>
                                    <select name="status[]" class="form-control select2{{ $errors->has('status') ? ' is-invalid' : '' }}" required>
                                        @foreach ($status as $item)
                                            <option value="{{ $item }}" >{{ strtoupper($item) }}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('status'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('status') }}</strong>
                                        </span>
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </div>
    <div class="card-footer">
        <div class="text-right">
            <div class="form-group mb-0">
                <button type="reset" class="btn btn-secondary"><i class="fas fa-undo mr-1"></i> Reset</button>
                <button type="submit" class="btn btn-primary" name="btn_absen" {{ $info ?? '' }}><i class="fas fa-check-double mr-1"></i> Simpan</button> 
            </div>
        </div>
    </div>