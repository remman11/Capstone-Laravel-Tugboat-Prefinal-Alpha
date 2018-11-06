<div class="table-responsive">
            <table class="detailedTable text-center table table-striped" style="width:100%">
                <thead class="bg-primary">
                    <tr>
                        <th>Ticket #</th>
                        <th>Tugboat Used</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Time Arrived</th>
                        <th>Purpose of Service</th>
                        <th class="noSortAction">Actions</th>
                    </tr>
                </thead>
                <tbody>
        @if(count($dispatch3)>0)
            @foreach($dispatch3 as $dispatch3)
                    <tr>
                        <td>
                            {{$dispatch3->intDispatchTicketID}}
                        </td>
                        <td>
                            {{$dispatch3->strName}}
                        </td>
                        @if($dispatch3->strJOStartPoint == null)
										<td>
											{{$dispatch3->strPierName}} {{$dispatch3->strBerthName}}
										</td>
									@else
										<td>
											{{$dispatch3->strJOStartPoint}}
										</td>
									@endif
									@if($dispatch3->strJODestination == null)
										<td>
											{{$dispatch3->strBerthName}} {{$dispatch3->strPierName}}
										</td>
									@else
									<td>
                                        {{$dispatch3->strJODestination}}
									</td>
									@endif
								
									<td>{{$dispatch3->dateEnded}} {{$dispatch3->tmEnded}}</td>
                        <td>
                            {{$dispatch3->enumServiceType}}
                        </td>
                        <td style="width:15%">
                            <span data-target="#infoModal">
                            <div class="ml-1 mr-1">
                                <button  onclick="get({{$dispatch3->intDispatchTicketID}})" class="btnView btn btn-sm btn-primary waves-circle waves-effect" data-toggle="tooltip" title="View Details" role="button">
                                    <i class="bigIcon ion ion-ios-eye"></i>
                                </button>
                                <button class="btn btn-sm btn-success waves-circle waves-effect" data-toggle="tooltip" title="Print" role="button">
                                        <a class="miniIcon fa fa-print" target="_blank" href="{{url('/consignee/dispatchticket/'.$dispatch3->intDispatchTicketID.'/pdf')}}"></a>
                                </button>
                            </div>
                            </span>
                        </td>
                    </tr>
            @endforeach
        @else
                    <tr>
                        <td>no dispatch ticket found</td>
                    </tr>
        @endif
                </tbody>
{{--  --}}
            </table>
        </div>