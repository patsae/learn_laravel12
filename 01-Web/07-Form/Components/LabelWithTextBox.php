<?php

namespace App\View\Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class LabelWithTextBox extends Component
{
    public string $orientation;
    public string $id;
    public string $value;
    public string $class;

    public function __construct(string $orientation = "Vertical", string $id = "", string $value = "", string $class = "")
    {
        $this->orientation = $orientation == "Horizontal" ? "flex-row" : "flex-col";
        $this->id = !empty($id) ? $id : "";
        $this->value = !empty($value) ? $value : "";
        $this->class = !empty($class) ? $class : "";
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.label-with-text-box');
    }
}
