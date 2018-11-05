@extends('Consignee.Templates.ConsigneeTemplate')

@section('content')
    <section class="welcome">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1 class="title-4">Welcome
                        <span class="text-primary">{{ Auth::user()->name }} !</span>
                    </h1>
                    <hr class="line-seprate">
                </div>
            </div>
        </div>
    </section>
    @if(count($ongoing)>0)
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-12">
                    <h5 class="title-2"> Ongoing Job Orders
                        <span></span>
                    </h5>
                </div>
            </div>
        </div>
        <section class="statistic statistic2">
            <div class="container">
                <div class="row m-t-25">
                    @foreach($ongoing as $ongoing)
                        @if($ongoing->isDelayed == 1)
                            {{$ongoing->isDelayed}}
                            <div class="col-12 col-sm-12 col-lg-4 pendingCards">
                                <div class="card card-sm-2 card-primary border-primary">
                                    <div class="card-icon">
                                        <i class="ion ion-android-boat text-primary"></i>
                                    </div>
                                    <div class="card-header">
                                        <h4 class="text-primary mb-2">Job Order # {{$ongoing->intJobOrderID}}</h4>
                                    </div>
                                    <div class="card-body">
                                        <h3>{{$ongoing->strJODesc}}</h3>
                                        <small style="font-size:15px;" class="float-left mt-2"> {{Auth::user()->name}} </small>
                                        <h3 class="float-right mt-1" style="font-size: 15px;">
                                            <span class="">STATUS : </span>
                                            <button type="button" tab-index="-1" class="text-white btn btn-success btn-sm disabled" style="font-size: 12px; border-radius: 3px; font-weight:bold; pointer-events: none;" aria-disabled="true">ONGOING</button>
                                            <button type="button" tab-index="-1" class="text-white btn btn-danger btn-sm disabled" style="font-size: 12px; border-radius: 3px; font-weight:bold; pointer-events: none;" aria-disabled="true">DELAYED</button>
                                        </h3>
                                    </div>
                                    <div class="card-footer mt-2">
                                        <a href="#" data-toggle="modal" data-target="#moreInfoModal">More Info <i class="ion ion-ios-arrow-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        @else
                            <div class="col-12 col-sm-12 col-lg-4 pendingCards">
                                <div class="card card-sm-2 card-primary border-primary">
                                    <div class="card-icon">
                                        <i class="ion ion-android-boat text-primary"></i>
                                    </div>
                                    <div class="card-header">
                                        <h4 class="text-primary mb-2">Job Order # {{$ongoing->intJobOrderID}}</h4>
                                    </div>
                                    <div class="card-body">
                                        <h3>{{$ongoing->strJODesc}}</h3>
                                        <small style="font-size:15px;" class="float-left mt-2"> {{Auth::user()->name}} </small>
                                        <h3 class="float-right mt-1" style="font-size: 15px;">
                                            <span class="">STATUS : </span>
                                            <button type="button" tab-index="-1" class="text-white btn btn-success btn-sm disabled" style="font-size: 12px; border-radius: 3px; font-weight:bold; pointer-events: none;" aria-disabled="true">ONGOING</button>
                                        </h3>
                                    </div>
                                    <div class="card-footer mt-2">
                                        <a href="#" data-toggle="modal" data-target="#moreInfoModal">More Info <i class="ion ion-ios-arrow-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        @endif
                    @endforeach
                </div>
            </div>
        </section>
    @else
        <section class="statistic statistic2">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-lg-8" style="margin-left: auto; margin-right:auto;">
                        <div class="overview-item overview-item--c1">
                            <div class="overview__inner">
                                <div class="overview-box clearfix mt-4">
                                    <div class="icon">
                                        <i class="fas fa-clipboard-list"></i>
                                    </div>
                                    <div class="text">
                                        <h2>No Results Found.</h2>
                                        <span>You have No Ongoing Job Orders</span>
                                        <div class="mb-5">
                                            <a href="/consignee/joborders" class="text-white mt-5">
                                                Create and Request A Job Order
                                                <i class="fas fa-chevron-right mb-4"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif
    {{-- <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-12 col-12 col-sm-12">
                    <div class="card">
                        <div class="card-header bg-primary">
                            <h4 class="text-center text-white">Activity Log</h4>
                        </div>
                        <div class="card-body">
                            <ul class="list-unstyled list-unstyled-border">
                                <li class="media">
                                    <img class="mr-3 rounded-circle" width="50" src="/others/stisla_admin_v1.0.0/dist/img/tbLogo.png" alt="avatar">
                                    <div class="media-body">
                                        <div class="float-right"><small>10m</small></div>
                                        <div class="media-title">Administrator</div>
                                        <small>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</small>
                                    </div>
                                </li>
                                <li class="media">
                                    <img class="mr-3 rounded-circle" width="50" src="/others/stisla_admin_v1.0.0/dist/img/tbLogo.png" alt="avatar">
                                    <div class="media-body">
                                        <div class="float-right"><small>10m</small></div>
                                        <div class="media-title">Administrator</div>
                                        <small>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</small>
                                    </div>
                                </li>
                                <li class="media">
                                    <img class="mr-3 rounded-circle" width="50" src="/others/stisla_admin_v1.0.0/dist/img/tbLogo.png" alt="avatar">
                                    <div class="media-body">
                                        <div class="float-right"><small>10m</small></div>
                                        <div class="media-title">Administrator</div>
                                        <small>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</small>
                                    </div>
                                </li>
                                <li class="media">
                                    <img class="mr-3 rounded-circle" width="50" src="/others/stisla_admin_v1.0.0/dist/img/tbLogo.png" alt="avatar">
                                    <div class="media-body">
                                        <div class="float-right"><small>10m</small></div>
                                        <div class="media-title">Administrator</div>
                                        <small>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</small>
                                    </div>
                                </li>
                            </ul>
                            <div class="text-center">
                                <a href="#" class="btn btn-primary btn-round">
                                View All
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>  --}}
@endsection

@section('pakingshet')
    @include('Consignee.Dashboard.scripts')
@endsection