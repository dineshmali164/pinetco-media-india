<?php

namespace App\Models;

use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Post extends Model
{
    use HasFactory,Sluggable;

    protected $fillable = [
        'user_id',
        'title',
        'slug',
        'description',
        'image',
        'no_of_like',
        'user_list_liked',
    ];

    public function Sluggable()
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }
  

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function comments()
    {
        return $this->hasMany(PostComment::class);

    }

}
