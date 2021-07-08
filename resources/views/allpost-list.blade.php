@extends('layouts.app')

@section('css')
    <style type="text/css">
        * {
        box-sizing: border-box;
            }

            /* Add a gray background color with some padding */
            body {
            font-family: Arial;
            padding: 20px;
            background: #f1f1f1;
            }

            /* Header/Blog Title */
            .header {
            padding: 30px;
            font-size: 40px;
            text-align: center;
            background: white;
            }

            /* Create two unequal columns that floats next to each other */
            /* Left column */
            .leftcolumn {   
            float: left;
            width: 75%;
            }

            /* Right column */
            .rightcolumn {
            float: left;
            width: 25%;
            padding-left: 20px;
            }

            /* Fake image */
            .fakeimg {
            background-color: #aaa;
            width: 100%;
            padding: 20px;
            }

            /* Add a card effect for articles */
            .card {
            background-color: white;
            padding: 20px;
            margin-top: 20px;
            }

            /* Clear floats after the columns */
            .row1:after {
            content: "";
            display: table;
            clear: both;
            }

            /* Footer */
            .footer {
            padding: 20px;
            text-align: center;
            background: #ddd;
            margin-top: 20px;
            }

            /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
            @media screen and (max-width: 800px) {
            .leftcolumn, .rightcolumn {   
                width: 100%;
                padding: 0;
            }
            }
            .like__btn {
                border: none;
                background-color: #e74c3c;
                color: white;
                cursor: pointer;
                padding: 0.8rem;
                border-radius: 0.4rem;
                max-width: 200px;
                transition: all ease 0.3s;
                display: flex;
                align-items: center;

                &:hover {
                    background-color: rgba(#e74c3c, 0.8);
                }

                &:disabled {
                    background-color: #d4cfcf;
                    cursor: pointer;
                }
            }

            .like__icon {
                font-size: 1.2rem;
                margin-right: 0.3rem;
            }

            .like__number {
                font-size: 0.8rem;
            }

            // Container styling
            .container {
            height: 100vh;
            width: 100vw;
            display: flex;
            justify-content: center;
            align-items: center;
            }
            .avatar {
                position: relative;
                display: inline-block;
                width: 3rem;
                height: 3rem;
                font-size: 1.25rem;
                }

                .avatar-img,
                .avatar-initials,
                .avatar-placeholder {
                width: 100%;
                height: 100%;
                border-radius: inherit;
                }

                .avatar-img {
                display: block;
                -o-object-fit: cover;
                object-fit: cover;
                }

                .avatar-initials {
                position: absolute;
                top: 0;
                left: 0;
                display: -ms-flexbox;
                display: flex;
                -ms-flex-align: center;
                align-items: center;
                -ms-flex-pack: center;
                justify-content: center;
                color: #fff;
                line-height: 0;
                background-color: #a0aec0;
                }

                .avatar-placeholder {
                position: absolute;
                top: 0;
                left: 0;
                background: #a0aec0
                    url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20'%3e%3cpath fill='%23fff' d='M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z'/%3e%3c/svg%3e")
                    no-repeat center/1.75rem;
                }

                .avatar-indicator {
                position: absolute;
                right: 0;
                bottom: 0;
                width: 20%;
                height: 20%;
                display: block;
                background-color: #a0aec0;
                border-radius: 50%;
                }

                .avatar-group {
                display: -ms-inline-flexbox;
                display: inline-flex;
                }

                .avatar-group .avatar + .avatar {
                margin-left: -0.75rem;
                }

                .avatar-group .avatar:hover {
                z-index: 1;
                }

                .avatar-sm,
                .avatar-group-sm > .avatar {
                width: 2.125rem;
                height: 2.125rem;
                font-size: 1rem;
                }

                .avatar-sm .avatar-placeholder,
                .avatar-group-sm > .avatar .avatar-placeholder {
                background-size: 1.25rem;
                }

                .avatar-group-sm > .avatar + .avatar {
                margin-left: -0.53125rem;
                }

                .avatar-lg,
                .avatar-group-lg > .avatar {
                width: 4rem;
                height: 4rem;
                font-size: 1.5rem;
                }

                .avatar-lg .avatar-placeholder,
                .avatar-group-lg > .avatar .avatar-placeholder {
                background-size: 2.25rem;
                }

                .avatar-group-lg > .avatar + .avatar {
                margin-left: -1rem;
                }

                .avatar-light .avatar-indicator {
                box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.75);
                }

                .avatar-group-light > .avatar {
                box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.75);
                }

                .avatar-dark .avatar-indicator {
                box-shadow: 0 0 0 2px rgba(0, 0, 0, 0.25);
                }

                .avatar-group-dark > .avatar {
                box-shadow: 0 0 0 2px rgba(0, 0, 0, 0.25);
                }

                /* Font not working in <textarea> for this version of bs */

                textarea {
                font-family: inherit;
                }

    </style>
@endsection

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="row1">
                <div class="leftcolumn">
                  @forelse ($posts as $post)
                    <div class="card">
                        <h2>{{ $post->title }}</h2>
                        <h5>{{ date('M d,Y',strtotime($post->created_at)) }} </h5>
                        @if($post->image != null)
                            <div class="fakeimg" style="height:200px;">
                                <img src='{{ url("/posts/".$post->image)}} '>
                            </div>
                            @endif
                        <p>{{ucwords($post->user->name)}}</p>
                        <p>{{$post->description}}</p>
                        @if($post->user_list_liked != null)
                            @php
                                    $post_like_users = json_decode($post->user_list_liked);
                            @endphp
                            <button style="width: 12%; " class="like__btn animated"  @if(!in_array(auth()->user()->id,$post_like_users))  onclick="setlikeaction({{ $post->id }},{{ auth()->user()->id }})" @endif>
                                @if(in_array(auth()->user()->id,$post_like_users))
                                    <i style="color:red;" class="like__icon fa fa-heart"></i>
                                @else
                                    <i style="color:white;" class="like__icon fas fa-heart"></i>
                                @endif
                        @else
                            <button style="width: 12%; " class="like__btn animated"  onclick="setlikeaction({{ $post->id }},{{ auth()->user()->id }})">
                            <i style="color:white;"  class="like__icon fas fa-heart"></i>
                        @endif
                            @if ($post->no_of_like != 0)
                                <span class="like__number likenumber">{{ $post->no_of_like }}</span>
                            @endif
                        </button>
                        @if ($post->comments != null)
                            <h5>{{ count($post->comments)}} Comments</h5>
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
                          </div>
                        @endforeach
                                 
                                  <div class="comment-form d-flex align-items-center">
                                    <div class="flex-shrink-0">
                                      <div class="avatar avatar-sm rounded-circle">
                                      </div>
                                    </div>
                                    <div class="flex-grow-1 ms-2 ms-sm-3">
                                      <form action="{{ route("post-comment") }}" method="POST">
                                            @csrf
                                            <textarea class="form-control py-0 px-1 border-0 comment{{ $post->id }}" name="comment_text"  rows="5" colspan="5" placeholder="Start writing..." style="resize: none;"></textarea>
                                            <input type="hidden" name="user_id" value="{{ auth()->user()->id }}"> 
                                            <input type="hidden" name="post_id" value="{{ $post->id }}"> 
                                            <button type="submit" name="submit" class="btn btn-primary" onclick="addcomment({{ $post->id }},{{ auth()->user()->id}} )">Add Comment</button>
                                      </form>
                                    </div>
                                  </div>
                    </div>    
                  @empty
                  <div class="card">
                        <h3>Post is not available</h3>
                  </div>
                  @endforelse
                  {{ $posts->links() }}
        </div>
    </div>
</div>
@endsection

@section('script')

<script>
        function setlikeaction(post_id,user_id)
        {
            let _token   = $('meta[name="csrf-token"]').attr('content');
            
            $.ajax({
                type: "POST",
                url: 'setlike',
                data: {post_id:post_id ,user_id:user_id,_token:_token},
                dataType: 'json',
                success: function (data) {

                    window.location.reload();
                },
                error: function (data) {
                    console.log(data);
                }
            });
        }
</script>

@endsection
