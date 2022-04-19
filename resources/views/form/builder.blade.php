@extends('layouts.app')


@section('content')
<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="pull-left">
            <h2>Create/Update Form Definition</h2>
        </div>
    </div>
</div>


@if (count($errors) > 0)
    <div class="alert alert-danger">
        <strong>Whoops!</strong> There were some problems with your input.<br><br>
        <ul>
        @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
        @endforeach
        </ul>
    </div>
@endif


{!! Form::open(array('route' => 'form-builder.store','method'=>'POST')) !!}
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12">
        @csrf
        <input type="hidden" name="definition" id="definition" value="">

        <button type="submit" class="btn btn-outline-primary">
            <i class="fas fa-save" aria-hidden="true"></i>
            Save Form
        </button>    
    </div>
</div>

{!! Form::close() !!}
<div id="formio-builder"></div>
<script lang="text/javascript">
    window.onload = function () {
        new Formio.builder(
            document.getElementById('formio-builder'),
            @if(isset($definition)) {!! $definition !!} @else {} @endif,
            {} // these are the opts you can customize
        ).then(function(builder) {
            // Exports the JSON representation of the dynamic form to that form we defined above
            document.getElementById('definition').value = JSON.stringify(builder.schema);
            
            builder.on('change', function (e) {
                // On change, update the above form w/ the latest dynamic form JSON
                document.getElementById('definition').value = JSON.stringify(builder.schema);
            })
        });;
    };
</script>
@endsection