@php
    header ("Cache-Control: no-cache, must-revalidate");
    header ("Pragma: no-cache");
    header ("Content-type: application/x-msexcel");
    header ("Content-type: application/octet-stream");
    header ("Content-Disposition: attachment; filename=Laporan-salary-staff-".strtolower($salary->staff->name)."-periode-".ucwords($filter ?? 'All').".xls");
@endphp
<!DOCTYPE html>
<html>
<head>
    <title>Apurav - Report</title>
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
    
    <br>
    <table style="">
        <tr style="line-height: 1px;">
            <td>Staff Name</td>
            <td style="text-align: left" colspan="4">: {{ $salary->staff->name }}</td>
        </tr>
        <tr style="line-height: 1px;">
            <td>Salary/Day</td>
            <td style="text-align: left">: {{ number_format($salary->salary, 0, ',', '.') }}</td>
        </tr>
        <tr style="line-height: 1px;">
            <td>Overtime/Hours</td>
            <td style="text-align: left">: {{ number_format($salary->uang_overtime, 0, ',', '.') }}</td>
        </tr>
        <tr style="line-height: 1px;">
            <td>POT BPJS/Month</td>
            <td style="text-align: left">: {{ number_format($salary->pot_bpjs, 0, ',', '.') }}</td>
        </tr>
        <tr style="line-height: 1px;">
            <td style="width: 100px;">Periode Salary</td>
            <td style="text-align: left">: {{ ucwords($filter ?? 'All') }}</td>
        </tr>
    </table>
    <br>
    
    <table border="1" style="font-size: 14px;width: 100%;">
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
                    <td style="text-align: left">{{ date('d-m-Y', strtotime($item->tanggal_absen)) }}</td>
                    <td style="color: white; text-align: center; background-color: {{ $item->attendance->color }}">
                        {{ $item->attendance->name }}
                    </td>
                    <td style="text-align: center">{{ $item->attendance->value }}</td>
                    <td style="text-align: center">{{ $item->jumlah_lembur }}</td>
                    <td>Rp. {{ number_format($total, 0, ',', '.') }}</td>
                </tr>
                
                @php
                    $total = $total_hari + $total_lembur;
                    $grand_total += $total;
                    $grand_total_all = $grand_total + $salary->pot_bpjs;
                @endphp
            @empty
                <tr>
                    <td style="text-align: center" colspan="5">Tidak ada data untuk ditampilkan</td>
                </tr>
            @endforelse
            <tr style="font-weight: bold;">
               <td colspan="4">Grand Total Gaji</td>
               <td>Rp. {{ number_format($grand_total_all, 0, ',', '.') }}</td>
            </tr>
        </tbody>
    </table>       
</body>
</html>