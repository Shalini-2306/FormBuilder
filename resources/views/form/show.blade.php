@extends('layouts.app')


@section('content')


@if(Auth::user()->getRoleNames()[0] != 'Admin')
@if(isset($saveForm) && !empty($saveForm))
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
            <strong>Name:</strong>
            {{ $saveForm->user->name }}
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
            <strong>Form Data:</strong>
            {{$saveForm->form_submission}}
        </div>
    </div>
</div>
@else 
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12">
        <h1>No Records found</h1>
    </div>
</div>
@endif
@else


<table class="table table-bordered">
    <tr>
        <th>No</th>
        <th>Form Opened</th>
        <th>Form Submitted</th>
    </tr>
    <tr>
        <td>1</td>
        <td>{{ $openCount }}</td>
        <td>{{ count($saveForm) }}</td>
    
    </tr>
</table>
<br/><br/><br/><br/>
<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="pull-left">
            <h2> Submitted Form Details</h2>
        </div>
    </div>
</div>
<table class="table table-bordered">
  <tr>
     <th>No</th>
     <th>Name</th>
     <th width="280px">Action</th>
  </tr>
    @foreach ($saveForm as $key => $value)
    <tr>
        <td>{{ ++$i }}</td>
        <td>{{ $value->user->name }}</td>
        <td>{{ $value->form_submission }}</td>
    </tr>
    @endforeach
</table>


{!! $saveForm->render() !!} 
@endif
@endsection