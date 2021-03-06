
<div class="addJobOrder">
    <div class="card card-primary animated zoomIn fast">
        <div class="card-header">
            <a href="#" class="btnBack btn btn-lg btn-link float-left" data-toggle="tooltip" title="Back" role="button">
                <i class="ion-chevron-left"></i>
            </a>
            <h4 class="text-center mr-5">Add Job Order</h4>
        </div>
        <div class="card-body">
            <form class="needs-validation" novalidate="">
                <div class="row">
                    <div class="col-12 col-sm-12 col-lg-6">
                        <div class="form-group">
                            <label for="transacDate">Transaction Date<sup class="text-primary">&#10033;</sup></label>
                            <div class="input-group date" id="transacDate" data-target-input="nearest">
                                <input type="text" class="form-control datetimepicker-input" data-target="#transacDate" placeholder="MM/DD/YYYY" required>
                                <div class="input-group-append" data-target="#transacDate" data-toggle="datetimepicker">
                                    <button type="button" class="btn btn-outline-primary waves-effect"><i class="fa fa-calendar"></i></button>
                                </div>
                                <div class="invalid-feedback">
                                    Please fill in the Transaction Date.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-12 col-lg-6">
                        <div class="form-group">
                            <label for="haulingETA">Estimated Time of Hauling<sup class="text-primary">&#10033;</sup></label>
                            <div class="input-group date" id="haulingETA" data-target-input="nearest">
                                <input type="text" class="form-control datetimepicker-input" data-target="#haulingETA" placeholder="21:00" required>
                                <div class="input-group-append" data-target="#haulingETA" data-toggle="datetimepicker">
                                    <button type="button" class="btn btn-outline-primary waves-effect"><i class="fa fa-clock"></i></button>
                                </div>
                                <div class="invalid-feedback">
                                    Please fill in the Estimated Time of Hauling.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" id="firstRow">
                    <div class="col-12 col-sm-12 col-lg-4">
                        <div class="form-group">
                            <label for="cargoName1">Cargo Name 1<sup class="text-primary">&#10033;</sup></label>
                            <input type="text" class="form-control" id="cargoName1" placeholder="Energy Moon" required>
                            <div class="invalid-feedback">
                                Please fill in the Cargo Name.
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-12 col-lg-4">
                        <div class="form-group">
                            <label for="cargoWeight1">Cargo Weight 1<sup class="text-primary">&#10033;</sup></label>
                            <div class="input-group">
                                <input id="cargoWeight1" type="number" class="form-control" placeholder="20" required>
                                <div class="input-group-append">
                                    <span class="input-group-text">Tons</span>
                                </div>
                                <div class="invalid-feedback">
                                    Please fill in the Cargo Weight.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-12 col-lg-4">
                        <div class="form-group">
                            <label for="addGoods1">Goods to be delivered 1<sup class="text-primary">&#10033;</sup></label>
                            <input type="text" class="form-control" id="addGoods1" placeholder="Very Good" required>
                            <div class="invalid-feedback">
                                Please fill in the Estimated Goods to be delivered.
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="float-right">
                            <button type="button" class="btn btn-primary btn-sm text-center waves-effect btnRemoveFields" data-toggle="tooltip" title="Delete Fields">
                                <i class="fas fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-primary btn-sm text-center waves-effect btnAddFields" data-toggle="tooltip" title="Add Fields">
                                <i class="fas fa-plus"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="addExDetails">Extra Details</label>
                    <textarea class="form-control" id="addExDetails" rows="5"></textarea>
                </div>
                <button class="btn btn-primary float-right waves-effect submitJO">Submit</button>
            </form>
        </div>
    </div>
</div>