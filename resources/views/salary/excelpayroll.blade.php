@php
    header ("Cache-Control: no-cache, must-revalidate");
    header ("Pragma: no-cache");
    header ("Content-type: application/x-msexcel");
    header ("Content-type: application/octet-stream");
    header ("Content-Disposition: attachment; filename=Laporan-salary-staff-periode-".ucwords($filter ?? 'All').".xls");
@endphp
<!DOCTYPE html>
<html>
<head>
    <title>Estetika Karya - Report Payroll</title>
    <style>
        #master td{
            vertical-align: middle;
            
        }
    </style>
</head>
<body>
    <div style="text-align: center; font-size: 20px;">
        <b>DATA SALARY STAFF</b>
    </div>         
        
    <table border="1" style="font-size: 14px;width: 100%;">
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
        <tbody>
            @forelse ($salary as $item)
            <tr>
                <td>{{ ucwords($item->periode) }}</td>
                <td>{{ $item->staff->name }}</td>
                <td>{{ 'Rp. ' . number_format($item->staff->position->salary ?? '', 0, ',', '.') }} {{ $item->staff->position->status == 'Staff' ? '/ Bln' : '/ Hari' }}</td> 
                <td>{{ $item->tgl_salary }}</td>
                <td>{{ $item->status ?? 'Outsourcing' }} </td>
                <td>{{ $item->jumlah_overtime }} Jam</td>
                <td>Rp. {{ number_format($item->uang_overtime, 0, ',', '.') }} / Jam</td>
                <td>Rp. {{ number_format($item->pot_bpjs, 0, ',', '.') }}</td>
                <td>Rp. {{ number_format($item->transportasi, 0, ',', '.') }}</td>
                <td class="font-weight-bold">Rp. {{ number_format($item->total, 0, ',', '.') }}</td>
            </tr>
            @empty
                <tr>
                    <td class="text-center" colspan="7">Tidak ada data untuk ditampilkan</td>
                </tr>
            @endforelse
        </tbody>
    </table>       
</body>
</html>