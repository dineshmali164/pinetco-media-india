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
                                <input id="title" disabled type="text" class="form-control @error('title') is-invalid @enderror" name="title" value="{{ $post->title }}"  autocomplete="Title" autofocus>

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
                            <textarea name="description"  disabled class="form-control @error('description') is-invalid @enderror"  id="description" placeholder="description" cols="30" rows="10">{{ $post->description }}</textarea>

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

                            </div>
                        </div>

                        <div class="form-group row">
                            @if ($post->comments != null)
                            <h5>{{ count($post->comments)}} Comments</h5><br>
                        @endif
                        @foreach ($post->comments as $comment)
                        <div class="comments">
                            <div class="comment d-flex">
                              <div class="flex-shrink-0">
                                <div class="avatar avatar-sm rounded-circle">
                                </div>
                              </div>
                              <div class="flex-shrink-1 ms-2 ms-sm-3">
                                <div class="comment-meta d-flex">
                                  <h6 class="me-2" style="margin-right: 7px;">{{ucwords($comment->user->name) }}</h6>
                                  <span class="text-muted" >{{ date('h:i:s M d,Y',strtotime($comment->created_at)) }}</span>
                                </div>
                                <div class="comment-body">
                                 {{ $comment->comment_text }}
                                </div>
                              </div>
                            </div>
                          </div><br>
                        @endforeach
                             
                        </div>



                        

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <a href='{{ url("post") }}' type="submit"   class="btn btn-primary registersubmit">
                                    {{ __('back') }}
                                </a>
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
