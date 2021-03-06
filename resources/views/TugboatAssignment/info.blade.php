<div class="modal fade " id="tugboatInfoModal" tabindex="-1" role="dialog" aria-labelledby="infoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg tugboatInfoInfoModal" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="infoModalLabel"><i class="fas fa-ship"></i><span id="titleTugboatInfoName"></span></h5>
                <button type="button" class="close modalClose"></button>
                <span aria-hidden="true"><i class="ion-close-round"></i></span>
                </button>
            </div>
            <div class="modal-body modalBody">
                <!-- Carousel -->
                <div id="imageCarousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#imageCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#imageCarousel" data-slide-to="1"></li>
                        <li data-target="#imageCarousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="/others/stisla_admin_v1.0.0/dist/img/tb1.JPG" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="/others/stisla_admin_v1.0.0/dist/img/tb2.jpg" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="/others/stisla_admin_v1.0.0/dist/img/tb3.jpg" alt="Third slide">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#imageCarousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#imageCarousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <br>
                <div class="container">
                    <div class="row">
                        <div class="col align-self-center">
                            <table class="table table-striped">
                                <thead class="bg-primary text-white">
                                    <tr class="text-white">
                                        <th scope="col">Main Information</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">Name</th>
                                        <td id="tugboatInfoName"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Length</th>
                                        <td id="tugboatInfoLength"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Breadth</th>
                                        <td id="tugboatInfoBreadth"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Depth</th>
                                        <td id="tugboatInfoDepth"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Horse Power</th>
                                        <td id="tugboatInfoHorsePower"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Maximum Speed</th>
                                        <td id="tugboatInfoMaxSpeed"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Bollard Pull</th>
                                        <td id="tugboatInfoBollardPull"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Gross Tonnage</th>
                                        <td id="tugboatInfoGrossTonnage"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Net Tonnage</th>
                                        <td id="tugboatInfoNetTonnage"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Last Dry Docked</th>
                                        <td id="tugboatInfoDryDocked"></td>
                                    </tr>
                                    {{-- <tr>
                                        <th scope="row">License Number</th>
                                        <td id="tugboatInfoLicenseNum"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">License Expiration Date</th>
                                        <td id="tugboatInfoLicenseExp"></td>
                                    </tr> --}}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <table class="table table-striped">
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col">Boat Specification</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">Location Built</th>
                                        <td id="tugboatInfoLocationBuilt"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Date Built</th>
                                        <td id="tugboatInfoDateBuilt"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Builder</th>
                                        <td id="tugboatInfoBuilder"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Maker Power</th>
                                        <td id="tugboatInfoMakerPower"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Hull Material</th>
                                        <td id="tugboatInfoHullMaterial"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Drive</th>
                                        <td id="tugboatInfoDrive"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Cylinder per Cycle</th>
                                        <td id="tugboatInfoCylCycle"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Auxiliary Engine</th>
                                        <td id="tugboatInfoAuxEngine"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col">
                            <table class="table table-striped">
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col">Boat Classification</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">Classification Number</th>
                                        <td id="tugboatInfoClassNum"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Official Number</th>
                                        <td id="tugboatInfoOfficialNum"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">IMO Number</th>
                                        <td id="tugboatInfoIMONum"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Flag</th>
                                        <td id="tugboatInfoFlag"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Type</th>
                                        <td id="tugboatInfoType"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Trading Area</th>
                                        <td id="tugboatInfoTradingArea"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Home Port</th>
                                        <td id="tugboatInfoHomePort"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">ISPS Code Compliance</th>
                                        <td id="tugboatInfoISPSCode"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">ISM Code Standard</th>
                                        <td id="tugboatInfoISMCode"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">AIS,GPS,VHF,Radar</th>
                                        <td id="tugboatInfoNavEquipments"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Insurances</th>
                                        <td id="tugboatInfoInsurances"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <input type="hidden" id="tugboatInfoID">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button role="button" class="btn btn-primary">Close</button>
            </div>
        </div>
    </div>
</div>