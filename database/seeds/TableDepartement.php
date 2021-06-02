<?php

use Illuminate\Database\Seeder;
use App\Models\Master\Departement;

class TableDepartement extends Seeder
{
    public function run()
    {
        $departement = [
            ['name'=>'Direktur'],
            ['name'=>'HRD'],
            ['name'=>'Accounting'],
            ['name'=>'Supervisor/Pengawas Lapangan'],
            ['name'=>'Driver'],
            ['name'=>'Outsourcing'],
        ];
        foreach($departement as $row)
        {
            Departement::create($row);
        }
    }
}
