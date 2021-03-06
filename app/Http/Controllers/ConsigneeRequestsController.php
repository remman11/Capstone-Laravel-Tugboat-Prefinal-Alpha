<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Http\JsonResponse;
use App\User;
use App\Company;
use Auth;
use DB; 

class ConsigneeRequestsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = DB::table('users as user')
        ->join('tblcompany as company','user.intUCompanyID','company.intCompanyID') 
        ->get();
        return view('ConsigneeRequests.index',compact('user'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $user = User::findOrFail($request->activateID);
        // if($user->isActive == 0){
        //     $user->isActive = 1;
        //     $user->save();
        // }else{
        //     $user->isActive = 0;
        //     $user->save();
        // }
        return response(['HI']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    public function activate(Request $request){
        // $user = User::findOrFail($request->activateID);
        // if($user->isActive == 0){
        //     $user->isActive = 1;
        // }else{
        //     $user->isActive = 0;
        // }
        // $user->save();
        // return response()->json(['success']);
        $user = User::findOrFail($request->activateID);
        if($user->isActive == 0){
            $user->isActive = 1;
            $user->save();
        }else{
            $user->isActive = 0;
            $user->save();
        }
        return response(['HI']);
    }
}
