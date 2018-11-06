<?php

namespace App\Http\Controllers\ConsigneeControllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Http\JsonResponse;

use Carbon\Carbon;
use App\Http\Controllers\Controller;

use App\Company;
use App\Contract;
use App\JobOrder;
use App\Goods;
use App\Berth;
use App\VesselType;

use Redirect;
use Auth;
use DB;

class JobOrdersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $goods =  Goods::where('boolDeleted',0)
        ->where('isActive',1)
        ->get();
        $contract = DB::table('tblcompany as company')
        ->leftjoin('tblcontractlist as contracts','contracts.intCCompanyID','company.intCompanyID')
        ->join('users as user','user.intUCompanyID','company.intCompanyID')
        ->where('user.intUCompanyID',Auth::user()->intUCompanyID)
        ->orderBy('contracts.intContractListID','DESC')
        ->limit('1')
        ->get();
        
        $berth = DB::table('tblberth as berth')
        ->join('tblpier as pier','berth.intBPierID','pier.intPierID')
        ->where('berth.isActive',1)
        ->get();
        
        $createdjob = JobOrder::where('boolDeleted',0)
        ->where('intJOCompanyID',Auth::user()->intUCompanyID)
        ->where('enumStatus','Created')
        ->get();
        $pendingjob = JobOrder::where('boolDeleted',0)
        ->where('intJOCompanyID',Auth::user()->intUCompanyID)
        ->where('enumStatus','!=', 'Created')
        ->orderBy('enumStatus','Asc')
        ->get();
        $ongoing = JobOrder::where('boolDeleted',0)
        ->where('intJOCompanyID',Auth::user()->intUCompanyID)
        ->where('enumStatus','Ongoing')
        ->get();
        $accepted = JobOrder::where('boolDeleted',0)
        ->where('intJOCompanyID',Auth::user()->intUCompanyID)
        ->where('enumStatus','Accepted')
        ->get();
        
        $cancelled = JobOrder::where('boolDeleted',0)
        ->where('intJOCompanyID',Auth::user()->intUCompanyID)
        ->where('enumStatus','Voided')
        ->get();

        $finishedjob = JobOrder::where('boolDeleted',0)
        ->where('intJOCompanyID',Auth::user()->intUCompanyID)
        ->where('enumStatus','Finished')
        ->get();
        
        $jobhistoryfinished = DB::table('tbljoborder as joborder')
        ->leftjoin('tbljobsched as jobsched','jobsched.intJSJobOrderID','joborder.intJobOrderID')
        ->where('joborder.intJOCompanyID',Auth::user()->intUCompanyID)
        ->where('jobsched.enumStatus','Finished')
        ->groupBy('joborder.intJobOrderID')
        ->orderBy('joborder.intJobOrderID','ASC')
        ->get();

        $jobhistorydeclined = DB::table('tbljoborder as joborder')
        ->leftjoin('tbljobsched as jobsched','jobsched.intJSJobOrderID','joborder.intJobOrderID')
        ->where('joborder.intJOCompanyID',Auth::user()->intUCompanyID)
        ->where('joborder.enumStatus','Declined')
        ->groupBy('joborder.intJobOrderID')
        ->get();

        $vesseltype = VesselType::all();
            return view('Consignee.Joborders.index',
            compact('goods','createdjob','pendingjob','accepted','ongoing','finishedjob','contract','berth','vesseltype','jobhistorydeclined','jobhistoryfinished','cancelled'));
        return response()->json(['jobhistory'=>$cancelled]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     * @return \Illuminate\Http\Request
     */
    public function create(Request $request)
    {
        try{
            DB::beginTransaction();
            $joborder = new JobOrder;
            $joborder->strJOTitle = $request->title;
            $joborder->strJODesc = $request->details;
            $joborder->intJOCompanyID = Auth::user()->intUCompanyID;
            $joborder->datStartDate = Carbon::parse($request->startDate)->format('Y/m/d');
            $joborder->datEndDate = Carbon::parse($request->EndDate)->format('Y/m/d');
            $joborder->tmStart = Carbon::parse($request->startTime);
            $joborder->tmEnd = Carbon::parse($request->endTime);
            $joborder->intJOBerthID = $request->berth;
            $joborder->strJOVesselName = $request->vesselName;
            $joborder->intJOVesselTypeID = $request->vesselType;
            $joborder->fltWeight = $request->vesselWeight;
            $joborder->enumServiceType = $request->serviceType;
            $joborder->enumStatus = 'Created';
            $joborder->save();
            DB::commit();
            return response()->json(['joborder'=>$joborder]);
        }catch(\Illuminate\Database\QueryException $errors){
            DB::rollback();
            $errorMessage = $errors->getMessage();
            return response()->json(['message'=>$errorMessage,'inputs'=>$request->all()]);
            // return Redirect::back()->withErrors($errorMessage);
        }
    

    }
    public function haulingservice(Request $request){
        $id = JobOrder::max('intJobOrderID');
        if(count($request->all()) == null){
            return response()->json([],204);
        }else{
            try{
                DB::beginTransaction();
                $joborder = new JobOrder;
                $joborder->strJOTitle = $request->title;
                $joborder->strJODesc = $request->details;
                $joborder->intJOCompanyID = Auth::user()->intUCompanyID;
                $joborder->datStartDate = Carbon::parse($request->startDate)->format('Y/m/d');
                $joborder->datEndDate = Carbon::parse($request->endDate)->format('Y/m/d');
                $joborder->tmStart = Carbon::parse($request->startTime);
                $joborder->tmEnd = Carbon::parse($request->endTime);
                $joborder->intJOGoodsID = $request->goods;
                if(!empty($request->berth)){
                    $joborder->intJOBerthID = $request->berth;
                }
                if(!empty($request->sLocation)){
                    $joborder->strJOStartPoint = $request->sLocation;
                }
                if(!empty($request->dLocation)){
                    $joborder->strJODestination = $request->dLocation;
                }
                $joborder->strJOVesselName = $request->vesselName;
                // $joborder->intJOVesselTypeID = $request->vesselType;
                $joborder->fltWeight = $request->vesselWeight;
                $joborder->enumServiceType = $request->serviceType;
                $joborder->enumStatus = 'Created';
                $joborder->save();
                DB::commit();
                return response()->json(['joborder'=>$joborder]);
            }catch(\Illuminate\Database\QueryException $errors){
                // DB::statement('ALTER TABLE tbljoborder AUTO_INCREMENT=:$id');
                // DB::commit();
                DB::rollBack();
                $errorMessage = $errors->getMessage();
                return response()->json(['errorMessage'=>$errorMessage,'inputs'=>$request->all()],500);
                // return response()->json('hi');
                // return Redirect::back()->withErrors($errorMessage);
            }
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store($intJobOrderID)
    {
        $joborder = JobOrder::findOrFail($intJobOrderID);
        $joborder->timestamps = false;
        $joborder->enumStatus = 'Pending';
        $joborder->save();
        return response()->json(['joborder'=>$joborder]);    
    }

    public function cancelleddetails($intJobOrderID){
        $job = JobOrder::findOrFail($intJobOrderID);

        $joborder = [];

        if($job->enumServiceType == 'Hauling'){
            if($job->intJOBerthID == null){
                $joborder = DB::table('tbljoborder as joborder')
                ->join('tblgoods as goods','joborder.intJOGoodsID','goods.intGoodsID')
                ->join('tblcompany as company','joborder.intJOCompanyID','company.intCompanyID')
                ->where('joborder.enumStatus','Voided')
                ->where('joborder.intJobOrderID',$intJobOrderID)
                ->get();
                $service = 'HAULING';
                $berth = 'NONE';
            }else{
                $joborder = DB::table('tbljoborder as joborder')
                ->join('tblberth as berth','joborder.intJOBerthID','berth.intBerthID')
                ->join('tblpier as pier','berth.intBPierID','intPierID')
                ->join('tblgoods as goods','joborder.intJOGoodsID','goods.intGoodsID')
                ->join('tblcompany as company','joborder.intJOCompanyID','company.intCompanyID')
                ->where('joborder.enumStatus','Voided')
                ->where('joborder.intJobOrderID',$intJobOrderID)
                ->get();
                $service = 'HAULING';
                $berth = 'Yes';
            }
        }else if($job->enumServiceType == 'Tug Assist'){
            $joborder = DB::table('tbljoborder as joborder')
            ->join('tblberth as berth','joborder.intJOBerthID','berth.intBerthID')
            ->join('tblpier as pier','berth.intBPierID','intPierID')
            // ->join('tblgoods as goods','joborder.intJOGoodsID','goods.intGoodsID')
            ->join('tblcompany as company','joborder.intJOCompanyID','company.intCompanyID')
            ->where('joborder.enumStatus','Voided')
            ->where('joborder.intJobOrderID',$intJobOrderID)
            ->get();    
        }
        

        return response()->json(['joborder'=>$joborder,'job'=>$job]);
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

    public function delete(Request $request){
        $joborder = JobOrder::findOrFail($request->joborderID);
        $joborder->timestamps = false;
        $joborder->boolDeleted = 1;
        $joborder->save();
        
        return response()->json(['joborder'=>$joborder]);
    }

    public function notifs(Request $request){
        
        $cancelledjoborder = JobOrder::where('boolDeleted',0)
        ->where('enumStatus','Voided')
        ->where('intJOCompanyID',Auth::user()->intUCompanyID)
        ->get();

        return response()->json(['joborder'=>$cancelledjoborder]);
    }

}
