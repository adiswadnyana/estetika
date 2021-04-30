<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTableAttendance extends Migration
{
    public function up()
    {
        Schema::create('tb_attendance', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->char('value', 3);
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('tb_attendance');
    }
}
