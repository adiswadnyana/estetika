<?php

use Illuminate\Database\Seeder;
use App\Models\Master\Position;

class TablePosition extends Seeder
{
    public function run()
    {
        $position = [
            ['name'=>'Cheif'],
            ['name'=>'Manager'],
            ['name'=>'Supervisor'],
            ['name'=>'Head'],
            ['name'=>'Helper'],
        ];
        foreach($position as $row)
        {
            Position::create($row);
        }
    }
}
