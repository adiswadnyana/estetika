<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Master\Staff;
use Illuminate\Database\Eloquent\SoftDeletes;

class Salary extends Model
{
    use SoftDeletes;

    protected $table = 'tb_salary';
    protected $fillable = ['staff_id', 'tgl_salary', 'salary', 'uang_overtime', 'pot_bpjs'];
    protected $dates = ['deleted_at'];

    public function staff()
    {
        return $this->belongsTo(Staff::class);
    }

    public function absensi()
    {
        return $this->hasMany(Absensi::class);
    }
}
