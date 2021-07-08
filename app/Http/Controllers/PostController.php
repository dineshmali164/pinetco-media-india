<?php

namespace App\Http\Controllers;

use Notification;
use App\Models\Post;
use App\Models\User;
use App\Models\PostLike;
use App\Models\PostComment;
use Illuminate\Http\Request;
use App\Http\Requests\PostRequest;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use App\Notifications\SendLikeNotification;
use App\Notifications\PostCreateNotification;
use App\Notifications\SendCommentNotification;
use Cviebrock\EloquentSluggable\Services\SlugService;


class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = Post::with('comments')->where('user_id',auth()->user()->id)->orderBy('id','desc')->get();
        return view('post.index',compact('posts'));

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('post.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(PostRequest $request)
    { 
        $postRequest = $request->all();

        if($request->image)
        {
            $request->validate([
                'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
            ]);
            $imageName = time().'.'.$request->image->extension();  
   
            $request->image->move(public_path('posts'), $imageName);
            $postRequest['image'] = $imageName;
        }
        
        $postRequest['user_id'] = auth()->user()->id;
        $postRequest['slug'] = SlugService::createSlug(Post::class, 'slug', $request->title);
        $user = User::find(auth()->user()->id);
        $post =  Post::create($postRequest);
        $details = [
            'greeting' => 'Hi '.auth()->user()->name.' Added New Post',
            'body' => 'New Post Added in Pinetco Media',
            'thanks' => 'Thank you for using Pinetco.com !',
            'actionText' => 'view post',
            'actionURL' => url('post/'.$post->slug)
        ];
  
        $same_company_users  = User::where('organization_id',auth()->user()->organization_id)->get();
        foreach($same_company_users as $same_company_users)
        {
            Notification::route('mail' , $same_company_users->email)->notify(new PostCreateNotification($details));
            // Notification::send($same_company_users, new PostCreateNotification($details));
        }

        return redirect('post')->with('success','Post Created Successfully');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

     public function GetPost($slug)
     {
         dd($slug);
     }

    public function show($slug)
    {
        $post = Post::where('slug',$slug)->first();
        return view('post.view',compact('post'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $post = Post::find($id);
        return view('post.edit',compact('post'));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(PostRequest $request, $id)
    {
        $postRequest = $request->all();

        if($request->image)
        {
            $request->validate([
                'image' => 'required|image|mimes:jpg,jpeg,gif,svg|max:2048',
            ]);
            $imageName = time().'.'.$request->image->extension();  
   
            $request->image->move(public_path('posts'), $imageName);
            $postRequest['image'] = $imageName;
        }
        
        $postRequest['user_id'] = auth()->user()->id;
        Post::find($id)->update($postRequest);
        return redirect('post')->with('info','Post Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $Post = Post::find($id);
        $Post->delete(); 
        return redirect('post')->with('error','Post Deleted Successfully');;

    }

    public function listAllPOsts()
    {
        $posts = Post::orderBy('id','desc')->paginate(10);
        return view('allpost-list',compact('posts'));
    }

    private function createSlug($name)
    {
        if (static::whereSlug($slug = Str::slug($name))->exists()) {

            $max = static::whereName($name)->latest('id')->skip(1)->value('slug');

            if (isset($max[-1]) && is_numeric($max[-1])) {

                return preg_replace_callback('/(\d+)$/', function ($mathces) {

                    return $mathces[1] + 1;
                }, $max);
            }
            return "{$slug}-2";
        }
        return $slug;
    }

    public function setlike(Request $request)
    {
        $checkpostislike = PostLike::where('post_id',$request->post_id)->where('user_id',$request->user_id)->first();

        $post = Post::where('id',$request->post_id)->first();
        
        if(!isset($checkpostislike->id))
        {
            PostLike::create($request->all());
            if($post->user_list_liked == null)
            {
                $postdata[] = $request->user_id;
                $postUpdateData = [
                    "user_list_liked" => json_encode($postdata),
                    "no_of_like" => 1
                ];
            } else {
                $post_users = json_decode($post->user_list_liked);
                array_push($post_users,$request->user_id);
                $postUpdateData = [
                    "user_list_liked" => json_encode($post_users),
                    "no_of_like" => $post->no_of_like+1
                ];  
            }
            Post::where('id',$request->post_id)->update($postUpdateData);

            $details = [
                'greeting' => 'Hi '.auth()->user()->name.' Like your Post',
                'body' => auth()->user()->name.' Like Your Post on Pinetco Media',
                'thanks' => 'Thank you for using Pinetco.com !',
                'actionText' => 'view post',
                'actionURL' => url('post/'.$post->slug)
            ];
            Notification::route('mail' ,$post->user->email)->notify(new SendLikeNotification($details));
            // Notification::route('mail' , $post->user->mail)->notify(new SendLikeNotification($details));
            return 1;
        } else {
            return 0;
        }

    }

    public function PostComment(Request $request)
    {        
        $post = Post::where('id',$request->post_id)->first();
        PostComment::create($request->all());
        $details = [
            'greeting' => 'Hi '.auth()->user()->name.' Comment your Post',
            'body' => auth()->user()->name.' Commented on your post '.$request->comment_text,
            'thanks' => 'Thank you for using Pinetco.com !',
            'actionText' => 'view post',
            'actionURL' => url('post/'.$post->slug)
        ];
        Notification::route('mail' ,$post->user->email)->notify(new SendCommentNotification($details));
        return  back();
    }
}
