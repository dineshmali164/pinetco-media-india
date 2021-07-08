@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Add  Post') }}</div>

                <div class="card-body">
                    <form method="POST" action='{{ url("post/$post->id") }}'  id="registerform" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="form-group row">
                            <label for="title" class="col-md-4 col-form-label text-md-right">{{ __('Title') }}<span style="color:red;">*</span></label>

                            <div class="col-md-6">
                                <input id="title" type="text" class="form-control @error('title') is-invalid @enderror" name="title" value="{{ $post->title }}"  autocomplete="Title" autofocus>

                                @error('title')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="description"  class="col-md-4 col-form-label text-md-right">{{ __('Description') }}<span style="color:red;">*</span></label>

                           
                            <div class="col-md-6">
                            <textarea name="description"  class="form-control @error('description') is-invalid @enderror"  id="description" placeholder="description" cols="30" rows="10">{{ $post->description }}</textarea>

                            <span style="color:red; font-size:10px; display:none;" id="EmailError"> </span>
                                @error('description')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>


                       

                        <div class="form-group row">
                            <label for="image" class="col-md-4 col-form-label text-md-right">{{ __('image') }}</label>

                            <div class="col-md-6">
                            @if($post->image != null)

                            <img src='{{ url("/posts/".$post->image)}}' width="60px"><br>
                            @endif

                                <input id="image" type="file" class="form-control @error('image') is-invalid @enderror" name="image"   >

                                @error('image')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit"   class="btn btn-primary registersubmit">
                                    {{ __('Submit') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('script')
 

@endsection
