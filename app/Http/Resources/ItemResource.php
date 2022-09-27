<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class ItemResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            "id" => $this->id,
            "name" => $this->name,
            "code" => $this->code,
            "subcategory" =>  new SubcategoryResource($this->subcategory),
            "owner" => $this::when($this->user() != null, $this->user->name),
            "description" => $this->description,
            "price" => $this->price,
            "photo" => asset(Storage::url($this->photo)),
            "discount" => $this->discount
        ];
    }
}
