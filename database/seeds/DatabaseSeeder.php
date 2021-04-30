<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(TableRoles::class);
        $this->call(TableUsers::class);
        $this->call(TableAttendance::class);
        $this->call(TablePosition::class);
        $this->call(TableDepartement::class);
    }
}
