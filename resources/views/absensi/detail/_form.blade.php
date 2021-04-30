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
                        <tr class="bg-dark">
                            <td class="text-center">#</td>
                            <td>Staff</td>
                            <td>Status</td>
                            <!-- <td>Tgl. Masuk</td> -->
                            <td>Departement</td>
                            <td class="text-center" style="min-width: 150px;">Attendance</td>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($departementStaff as $item)
                            <tr>
                                <!-- <input type="hidden" name="schedule_id[]" class="form-control " value="{{ $item->id }}" readonly required> -->
                                <input type="hidden" name="staff_id[]" class="form-control" value="{{ $item->staffId }}" readonly required>
                                <td class="text-center">{{ $loop->iteration }}</td>
                                <td>
                                    {{ $item->staffName }}
                                </td>
                                <td>
                                    <span class="badge {{ $item->position->status == 'Staff' ? 'badge-info' : 'badge-secondary' }}">{{ $item->position->status }}</span>
                                </td>
                                <!-- <td>{{ date('d-m-Y', strtotime($item->tgl_masuk)) }}</td> -->
                                <td>{{ $item->departement->name }}</td>
                                <td>
                                    <div class="float-right">
                                        <select name="attendance[]" class="form-control select2{{ $errors->has('attendance') ? ' is-invalid' : '' }}" required>
                                            @foreach ($attendance as $at)
                                                @php
                                                    $where = array(
                                                        'tanggal_absen' => $tanggal_absen,
                                                        'staff_id' => $item->staffId
                                                    );
                                                    $detail = $absen_detail->where($where)->first();
                                                    
                                                @endphp
                                                <option value="{{ $at->id }}"  {{ $detail && $at->id == $detail->attendance_id ? 'selected' : '' }}>{{ $at->name }}</option>
                                            @endforeach
                                        </select>
                                        @if ($errors->has('attendance'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('attendance') }}</strong>
                                            </span>
                                        @endif
                                    </div>
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
<script>
script type="text/javascript">
  $(function () {
      
    var table = $('.data-table').DataTable({
        processing: true,
        serverSide: true,
        ajax: {
          url: "{{ route('users.index') }}",
          data: function (d) {
                d.status = $('#status').val(),
                d.search = $('input[type="search"]').val()
            }
        },
        columns: [
            {data: 'id', name: 'id'},
            {data: 'name', name: 'name'},
            {data: 'email', name: 'email'},
            {data: 'status', name: 'status'},
        ]
    });
  
    $('#status').change(function(){
        table.draw();
    });
      
  });
</script>
