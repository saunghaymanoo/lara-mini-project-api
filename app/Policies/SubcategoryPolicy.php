<?php

namespace App\Policies;

use App\Models\Subcategory;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class SubcategoryPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view any models.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function before(User $user){
        if($user->role === 'admin' || $user->role === 'editor'){
            return true;
        }
    }
    public function viewAny(User $user)
    {
        //
    }

    /**
     * Determine whether the user can view the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Subcategory  $subcategory
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function view(User $user, Subcategory $subcategory)
    {
        //
    }

    /**
     * Determine whether the user can create models.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function create(User $user)
    {
        //
    }

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Subcategory  $subcategory
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function update(User $user, Subcategory $subcategory)
    {
        return $user->id === $subcategory->user_id;
    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Subcategory  $subcategory
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function delete(User $user, Subcategory $subcategory)
    {
        return $user->id === $subcategory->user_id;
    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Subcategory  $subcategory
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function restore(User $user, Subcategory $subcategory)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Subcategory  $subcategory
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function forceDelete(User $user, Subcategory $subcategory)
    {
        //
    }
}
