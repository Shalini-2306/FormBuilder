<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\Models\DynamicForm;

class BuilderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    function __construct()
    {
         $this->middleware('permission:create-dynamic-form', ['only' => ['create','store']]);
         $this->middleware('permission:create-dynamic-form', ['only' => ['create','store']]);
    }

    public function create()
    {
        $form = DynamicForm::select('form_definition')->first();

        $definition = $form && $form->form_definition !='' ? $form->form_definition : null;

        return view('form.builder')->with([
            // can provide a previously-saved form definition here
            'definition' => $definition, 
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'definition' => 'required|json'
        ]);
        
        // Save this to your DB, a file
       //dump($data['definition']);
        $user_id = Auth::user()->id;
            
        $formData = DynamicForm::first();

        if($formData) {
            $formData->user_id = $user_id;
            $formData->form_definition = $data['definition'];
            $formData->save();

        } else {
            $data['user_id'] = $user_id;
            $data['form_definition'] = $data['definition'];
            $form = DynamicForm::create($data);
        }
        return redirect()->route('create-dynamic-form');
        
    }
}
