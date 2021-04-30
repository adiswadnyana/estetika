<?php

use Illuminate\Database\Seeder;
use App\Models\Master\Attendance;

class TableAttendance extends Seeder
{
    public function run()
    {
        $attendance = [
            ['name'=>'Present', 'value'=>1],
            ['name'=>'Permision', 'value'=>0],
            ['name'=>'Sick', 'value'=>0],
            ['name'=>'Alpha', 'value'=>0],
        ];
        foreach($attendance as $row)
        {
            Attendance::create($row);
        }
    }
}
