
@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
        @include('layouts.flash-message')
        <table class="table">
            <thead>
                <tr>
                <th scope="col">#</th>
                <th scope="col">Title</th>
                <th scope="col">Description</th>
                <th scope="col">Image</th>
                <th scope="col">Total Like </th>
                <th scope="col">Total Comment </th>
                <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $i = 10;
                @endphp
                @forelse($posts as $post)
                    <tr>
                        <th scope="row">{{ ++$i }}</th>
                        <td>{{ \Illuminate\Support\Str::limit($post->title , 20,  '...') }}</td>
                        <td>{{ \Illuminate\Support\Str::limit($post->description , 30,  '...') }}</td>
                        <td>
                        @if($post->image != null)
                            <img src='{{ url("/posts/".$post->image)}} ' width="60px">
                        @endif
                        </td>
                        <td>{{ $post->no_of_like }}</td>
                        <td>{{ count($post->comments) }}</td>
                        <td>
                            <a class="btn btn-info" href='{{ url("post/$post->slug") }}'>Show</a>
                            <a class="btn btn-primary" href='{{ url("post/$post->id/edit") }}'>Edit</a>
                            <form method="post" action="{{route('post.destroy',$post->id)}}">
                                {{ method_field('delete') }}
                                {{ csrf_field() }}
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                @empty
                <tr>
                <th colspan="4"><h1>Post Not available</h1></th>
                
                </tr>
                @endforelse
                
            </tbody>    
            </table>
        </div>
    </div>
</div>
@endsection

@section('script')
 

@endsection
