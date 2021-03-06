<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Http\JsonResponse;

use App\User;
use App\Company;
use Auth;
use DB; 
class ConsigneeAccountsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $activeuser = DB::table('users as user')
        ->join('tblcompany as company','user.intUCompanyID','company.intCompanyID') 
        ->where('user.isActive',1)
        ->where('user.enumUserType','Consignee')
        ->get();
        $inactiveuser = DB::table('users as user')
        ->join('tblcompany as company','user.intUCompanyID','company.intCompanyID') 
        ->where('user.isActive',0)
        ->where('user.enumUserType','Consignee')
        ->get();
        return view('ConsigneeAccounts.index',compact('activeuser','inactiveuser'));
        // return response()->json(['activeuser'=>$activeuser]);
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($intCompanyID)
    {
        $user = DB::table('users as user')
        ->join('tblcompany as company','user.intUCompanyID','company.intCompanyID')
        ->where('company.intCompanyID',$intCompanyID)
        ->get();
        return response()->json(['user'=>$user]);
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
