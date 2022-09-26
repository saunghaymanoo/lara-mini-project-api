<?php

namespace Database\Seeders;

use App\Models\Subcategory;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SubcategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Subcategory::factory()->create([
            'title' => 'woman shirt',
            'category_id' => 1 ,
            'user_id' => User::inRandomOrder()->first()->id
        ]);
        Subcategory::factory()->create([
            'title' => 'man shirt',
            'category_id' => 1 ,
            'user_id' => User::inRandomOrder()->first()->id
        ]);
        Subcategory::factory()->create([
            'title' => 'wallet',
            'category_id' => 2 ,
            'user_id' => User::inRandomOrder()->first()->id
        ]);
        Subcategory::factory()->create([
            'title' => 'woman shoe',
            'category_id' => 3 ,
            'user_id' => User::inRandomOrder()->first()->id
        ]);
        Subcategory::factory()->create([
            'title' => 'shampoo',
            'category_id' => 4 ,
            'user_id' => User::inRandomOrder()->first()->id
        ]);
        Subcategory::factory()->create([
            'title' => 'litstick',
            'category_id' => 4 ,
            'user_id' => User::inRandomOrder()->first()->id
        ]);
    }
}
