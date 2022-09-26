<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\Category;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Storage;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'admin',
        //     'email' => 'admin@gamil.com',
        // ]);

            $this->call([
                UserSeeder::class,
                SubcategorySeeder::class
            ]);
            $categories = ["Shirt","Bag","Shoe","Cosmetic"];
            foreach($categories as $category){
                Category::factory()->create([
                    "title" => $category,
                    "user_id" => User::inRandomOrder()->first()->id
                ]);
            }

            $photos = Storage::allFiles("public");
            array_shift($photos);
            Storage::delete($photos);
            echo "Storage clean";

    }
}
