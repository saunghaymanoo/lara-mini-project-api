<?php

namespace App\Policies;

use App\Models\Category;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class CategoryPolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }
    public function before(User $user){
        if($user->role === 'admin' || $user->role === 'editor'){
            return true;
        }
    }
    public function update(User $user,Category $category){
        return $user->id == $category->user_id;
    }
    public function delete(User $user,Category $category){
        return $user->id == $category->user_id;
    }
}
