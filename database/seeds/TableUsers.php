<?php

use Illuminate\Database\Seeder;
use App\Models\Users;
use App\Models\Master\Staff;

class TableUsers extends Seeder
{
    public function run()
    {
        $admin = DB::table('roles')->where('name', 'admin')->get()->first()->id;

        $user = Users::create([
            'role_id'   => $admin,
            'name'      => 'Administrator',
            'email'     => 'admin@gmail.com',
            'username'  => 'admin',
            'password'  => bcrypt('admin'),
        ]);
        
        Staff::create([
            'user_id' => $user->id,
            'position_id' => 1,
            'departement_id' => 1,
            'name' => ' I Kadek Adi Swadnyana',
            'birth' => date('Y-m-d'),
            'startdate' => date('Y-m-d'),
            'addres' => 'Denpasar',
            'addres' => '0',
        ]);
    }
}
