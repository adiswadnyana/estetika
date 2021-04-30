<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Master\Staff;

class Schedule extends Model
{
    protected $table = 'tb_schedule';
    protected $fillable = ['staff_id', 'position_id', 'departement_id', 'tgl_masuk', 'ket_schedule', 'status'];
    protected $dates = ['deleted_at'];

    public function getTglmasukAttribute($name)
    {
        return date('d-m-Y', strtotime($name));
    }

    public function staff()
    {
        return $this->belongsTo(Staff::class);
    }
}
