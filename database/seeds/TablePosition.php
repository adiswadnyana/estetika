<?php

use Illuminate\Database\Seeder;
use App\Models\Master\Position;

class TablePosition extends Seeder
{
    public function run()
    {
        $position = [
            ['name'=>'Direktur'],
            ['name'=>'HRD'],
            ['name'=>'Accounting'],
            ['name'=>'Supervisor'],
            ['name'=>'Driver'],
            ['name'=>'Outsourcing'],
        ];
        foreach($position as $row)
        {
            Position::create($row);
        }
    }
}
