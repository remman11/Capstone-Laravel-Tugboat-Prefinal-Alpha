@extends('Consignee.Templates.ConsigneeTemplate')

@section('styles')
    @include('Consignee.Billing.styles')
@endsection

@section('scripts')
    @include('Consignee.Billing.scripts')
@endsection

@section('content')
    <section class="section">
		<div class="container">
			<div class="billingTable zoomIn animated fast">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-pills nav-fill" id="pills-tab" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" id="pillsPendingforPayment-tab" data-toggle="pill" href="#pillsPendingforPayment" role="tab" aria-controls="pillsPendingforPayment" aria-selected="true">Pending for Payment</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id="pillsPaid-tab" data-toggle="pill" href="#pillsPaid" role="tab" aria-controls="pillsPaid" aria-selected="false">Paid Bills</a>
							</li>
						</ul>
					</div>
					<div class="card-body">
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade show active" id="pillsPendingforPayment" role="tabpanel" aria-labelledby="pillsPendingforPayment-tab">
								<div class=" consigneeInvoices animated slideInLeft fast">
									<div class="card card-primary">
										<div class="card-header">
											<div class="float-right">
												<button id="btnPaySelected" class="btn btn-primary waves-effect animated zoomIn faster">
													Pay Selected
												</button>
											</div>
										</div>
										<div class="card-body p-0">
											<div class="table-responsive">
												<table class="table table-data2 text-center" style="width:100%">
													<thead>
														<tr>
															<th>
																<label class="au-checkbox">
																	<input type="checkbox" id="checkall">
																	<span class="au-checkmark"></span>
																</label>
															</th>
															<th>#</th>
															<th>Date of Transaction</th>
															<th>status</th>
															<th>Transaction Amount (&#8369;)</th>
															<th>Actions</th>
														</tr>
													</thead>
													<tbody>
														<tr class="tr-shadow">
															<td>
																<label class="au-checkbox">
																	<input type="checkbox" class="checkbox">
																	<span class="au-checkmark"></span>
																</label>
															</td>
															<td>0001</td>
															<td>2018-09-27 02:12</td>
															<td>
																<div class="badge badge-success">Processed</div>
															</td>
															<td>₱6790.00</td>
															<td>
																<div class="table-data-feature">
																	<button class="item waves-effect btnView" data-toggle="tooltip" data-placement="top" title="More">
																		<i class="zmdi zmdi-more"></i>
																	</button>
																	<button class="item waves-effect" data-toggle="tooltip" data-placement="top" title="Print">
																		<i class="miniIcon fa fa-print"></i>
																	</button>
																</div>
															</td>
														</tr>
														<tr class="spacer"></tr>
														<tr class="tr-shadow">
															<td>
																<label class="au-checkbox">
																	<input type="checkbox" class="checkbox">
																	<span class="au-checkmark"></span>
																</label>
															</td>
															<td>0002</td>
															<td>2018-09-29 05:57</td>
															<td>
																<div class="badge badge-success">Processed</div>
															</td>
															<td>$999.00</td>
															<td>
																<div class="table-data-feature">
																	<button class="item waves-effect btnView" data-toggle="tooltip" data-placement="top" title="More">
																		<i class="zmdi zmdi-more"></i>
																	</button>
																	<button class="item waves-effect" data-toggle="tooltip" data-placement="top" title="Print">
																		<i class="miniIcon fa fa-print"></i>
																	</button>
																</div>
															</td>
														</tr>
														<tr class="spacer"></tr>
														<tr class="tr-shadow">
															<td>
																<label class="au-checkbox">
																	<input type="checkbox" class="checkbox">
																	<span class="au-checkmark"></span>
																</label>
															</td>
															<td>0003</td>
															<td>2018-09-25 19:03</td>
															<td>
																<div class="badge badge-danger">Denied</div>
															</td>
															<td>$1199.00</td>
															<td>
																<div class="table-data-feature">
																	<button class="item waves-effect btnView" data-toggle="tooltip" data-placement="top" title="More">
																		<i class="zmdi zmdi-more"></i>
																	</button>
																	<button class="item waves-effect" data-toggle="tooltip" data-placement="top" title="Print">
																		<i class="miniIcon fa fa-print"></i>
																	</button>
																</div>
															</td>
														</tr>
														<tr class="spacer"></tr>
														<tr class="tr-shadow">
															<td>
																<label class="au-checkbox">
																	<input type="checkbox" class="checkbox">
																	<span class="au-checkmark"></span>
																</label>
															</td>
															<td>0004</td>
															<td>2018-09-24 19:10</td>
															<td>
																<div class="badge badge-success">Processed</div>
															</td>
															<td>$699.00</td>
															<td>
																<div class="table-data-feature">
																	<button class="item waves-effect btnView" data-toggle="tooltip" data-placement="top" title="More">
																		<i class="zmdi zmdi-more"></i>
																	</button>
																	<button class="item waves-effect" data-toggle="tooltip" data-placement="top" title="Print">
																		<i class="miniIcon fa fa-print"></i>
																	</button>
																</div>
															</td>
														</tr>

													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="pillsPaid" role="tabpanel" aria-labelledby="pillsPaid-tab"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	@include('Consignee.Billing.info')
	@include('Consignee.Billing.infoModal')
@endsection