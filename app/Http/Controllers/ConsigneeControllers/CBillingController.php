<?php

namespace App\Http\Controllers\ConsigneeControllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;
use Auth;
class CBillingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dispatch = DB::table('tbljoborder as joborder')
        ->join('tblservices as service','joborder.intJOServiceTypeID','service.intServicesID')
        ->join('tblberth as berth','joborder.intJOBerthID','berth.intBerthID')
        ->join('tblpier as pier','berth.intBPierID','pier.intPierID')
        // ->join('tblbarge as barge','joborder.intJOBargeID','barge.intBargeID')
        ->join('tblgoods as goods','joborder.intJOGoodsID','goods.intGoodsID')
        // ->join('tblvessel as vessel','joborder.intJOeVesselID','vessel.intVesselID')
        ->join('tblcompany as company','joborder.intJOCompanyID','company.intCompanyID')
        ->join('tbljobsched as jobsched','joborder.intJobOrderID','jobsched.intJSJobOrderID')
        ->join('tbltugboatassign as tugboatassign','jobsched.intJSTugboatAssignID','tugboatassign.intTAssignID')
        ->join('tbltugboat as tugboat','tugboatassign.intTATugboatID','tugboat.intTugboatID')
        ->join('tbltugboatmain as main','tugboat.intTTugboatMainID','main.intTugboatMainID')
        ->join('tbldispatchticket as dispatch','dispatch.intDTTugboatAssignID','tugboatassign.intTAssignID')
        ->join('tblinvoice as invoice','invoice.intIDispatchTicketID','dispatch.intDispatchTicketID')
        ->where('company.intCompanyID',Auth::user()->intUCompanyID)
        ->where('jobsched.enumstatus','Finished')
        ->get();
        return view('Consignee.Billing.index')->with('dispatch',$dispatch);
        
        // return response()->json(['dispatch'=>$dispatch]);  
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
}
