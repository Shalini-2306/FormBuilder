<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\models\DynamicForm;
use App\models\FormSubmission;
use App\models\FormRecord;
use Auth;

class FormController extends Controller
{
     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    function __construct()
    {
         $this->middleware('permission:form-view|form-submit|form-records', ['only' => ['create','store']]);
         $this->middleware('permission:form-view', ['only' => ['create','store']]);
         $this->middleware('permission:form-records', ['only' => ['show']]);
    }

    /**
     * Display the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $formRecord = FormRecord::first();

        $openCount = isset($formRecord->open_count) ? $formRecord->open_count+1 : 1;

        $form = DynamicForm::select('form_definition')->where('id', 1)->first(); 

        $definition = $form && $form->form_definition !='' ? $form->form_definition : null;

        $saveForm = FormSubmission::with('user')->where('user_id', Auth::user()->id)->first();// get form submission value

        if(Auth::user()->getRoleNames()[0] == 'Admin' || empty($saveForm)) {
            
            if(Auth::user()->getRoleNames()[0] != 'Admin') {
                FormRecord::where('id', 1)->update(['open_count' => $openCount]); // Update form open count
            }

            return view('form.form')->with([
                'definition' => $definition, // get some definition JSON
                'data' => '{}', // you can edit a form by providing the old data 
            ]);

        } else {

            return redirect()->route('form.show');

        }
        
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $user_id = Auth::user()->id;

        $data = array();

        $data['form_submission'] = $request->get('submissionValues');

        $data['user_id'] = $user_id;

        $saveForm = FormSubmission::with('user')->where('user_id', Auth::user()->id)->first();
        if(!$saveForm) {
            $form = FormSubmission::create($data);
        }

        return redirect()->route('form.show');
    }

    /**
     * Display the specified resource.
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        if(Auth::user()->getRoleNames()[0] == 'Admin') {
            $formRecord = FormRecord::first();

            $openCount = isset($formRecord->open_count) ? $formRecord->open_count : 0;

            $saveForm = FormSubmission::with('user')->orderBy('id','DESC')->paginate(5);

            return view('form.show',with(['saveForm' => $saveForm, 'openCount'=>$openCount]))
            ->with('i', ($request->input('page', 1) - 1) * 5);

        } else {
            $openCount = 0;

            $saveForm = FormSubmission::with('user')->where('user_id', Auth::user()->id)->first();

            return view('form.show',with(['saveForm' => $saveForm, 'openCount'=>$openCount]));
        }
        
    }
}
