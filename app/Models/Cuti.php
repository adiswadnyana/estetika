<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Master\Staff;

class Cuti extends Model
{
    protected $table = 'tb_cuti';
    protected $fillable = ['staff_id', 'jumlah_cuti', 'tgl_cuti'];

    public function staff()
    {
        return $this->belongsTo(Staff::class);
    }
}
