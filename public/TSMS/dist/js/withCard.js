$(document).ready(function(){
    // Custom Select
    $('select').niceSelect();

    /* START --- New update August 5, 2018 */
  //Initialize Date Picker for Last Dry Docked
  $('#AddLastDryDocked,#AddDateBuilt,#AddLicenseExpDate,#editLastDryDocked,#editDateBuilt,#editLicenseExpDate').datetimepicker({
    format: 'L'
  });
  /* Removed old datepicker
    END --- New update August 5, 2018 */
  // Country Picker
  $(".niceCountryInputSelector").each(function(i,e){
      new NiceCountryInput(e).init();
  });
// Initialize Tooltip
  $('[data-toggle="tooltip"]').tooltip();

  // Initialize Data Table
  var dtTitle = "Tugboat Services Management System"
  var table = $('.detailedTable').DataTable( {
  columnDefs: [
      { targets: 'noSortAction', orderable: false }
  ], 
  buttons: [
      {
          extend: 'copy',
          text: '&mdash; Copy &mdash;',
          title: dtTitle,
          className: 'btn btn-primary waves-effect',
          exportOptions: {
          columns: 'th:not(:last-child)',
          }
          },
          {
          extend: 'print',
          text: '&mdash; Print &mdash;',
          title: dtTitle,
          className: 'btn btn-primary waves-effect',
          exportOptions: {
          columns: 'th:not(:last-child)'
          }
          },
          {
          extend: 'pdf',
          text: '&mdash; PDF &mdash;',
          title: dtTitle,
          className: 'btn btn-primary waves-effect',
          exportOptions: {
          columns: 'th:not(:last-child)'
          }
          }
  ],
  "language": {
    "lengthMenu": 'Display <select class="custom-select custom-select form-control form-control">'+
    '<option hidden>1000</option>'+
    '<option value="-1">All</option>'+
    '<option value="10">10</option>'+
    '<option value="20">25</option>'+
    '<option value="50">50</option>'+
    '<option value="100">100</option>'+
    '</select> records'},

  responsive: true,
  fade:true
});

  table.buttons().container().appendTo('.exportButtons');
  $('.toast-close-button').css('color','black');
  toastr.options = {
    "closeButton": true,
    "positionClass": "toast-top-center",
    "showDuration": "5000",
    "hideDuration": "1000",
    "timeOut": "2000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  }
  $('.buttons-pdf').on('click',function() {
    toastr.success('PDF Downloaded!');
  });
// Carousel Change Image Speed
$(function(){
    $('.carousel').carousel({
        interval: 1800
    });
});

// Smart Wizard
  // Step show event
  $(".smartwizard").on("showStep", function(e, anchorObject, stepNumber, stepDirection, stepPosition) {
    //alert("You are on step "+stepNumber+" now");
    
    $(".sw-btn-next").addClass('waves-effect');
    $(".sw-btn-prev").addClass('waves-effect');
    if(stepPosition === 'first'){
        $("#prev-btn").addClass('disabled');
    }else if(stepPosition === 'final'){
        $("#next-btn").addClass('disabled'); 
    }else{
        $("#prev-btn").removeClass('disabled');
        $("#next-btn").removeClass('disabled');
    }
    if($('button.sw-btn-next').hasClass('disabled')){
      $('.sw-btn-group-extra').show();
      }else{
      $('.sw-btn-group-extra').hide();
      }
  });

  // Toolbar extra buttons
  var btnViewSummary = $('<button class="btn btn-primary waves-effect" >View Summary</button>')
    .on('click',function(){
      $('#viewSummaryModal').modal('show');
      });
  // Smart Wizard 
  $('.smartwizard').smartWizard({
          selected: 0,
          theme: 'arrows',
          transitionEffect:'fade',
          keyNavigation:false,
          showStepURLhash: false,
          toolbarSettings: {
            toolbarButtonPosition: 'end',
            toolbarExtraButtons: [btnViewSummary]
          },
          enableFinishButton: false
          
  });
  ////////////////////////////// Add Insurance for Add
  //Append another field for insurance
  ctrAdd = 0;
  // Append and Remove
  $('#btnAddInsuranceAdd').on('click',function() {
    var addAppend = 
        `<div class="col-12 col-lg-3 addContainer">
            <div class="form-group">
                <label for="AddInsurance">Insurance<sup class="text-primary">&#10033;</sup></label>
                <input type="text" class="form-control" id="AddInsurance" name="AddInsurance" placeholder="Tugboat Insurance">
                <button type="button" class="btn btn-primary btn-sm text-center waves-effect btnRemoveFields mt-2 float-right" data-toggle="tooltip" title="Delete Fields">
                    <i class="fas fa-minus"></i>
                </button>
            </div>
        </div>`;
    if(ctrAdd==3){
        swal({
            title: "Maximum of 3 Additional Fields!",
            type: "error",
            confirmButtonClass: "btn-danger waves-effect",
            confirmButtonText: "Ok",
            closeOnConfirm: false
        });
    }else if(ctrAdd<3){
        $(addAppend).appendTo('#firstRow').addClass( "animated fadeIn fast" ) ;
        ctrAdd++;
    }
  });
  $('#firstRow').on('click',".btnRemoveFields",function(event){
    $(this).closest('.addContainer').fadeOut(200,function(){
      $(this).remove();
      ctrAdd--;
    });
    event.stopImmediatePropagation();
  });
    ////////////////////////////// Add Insurance for Edit

    ctrEdit = 0;
  // Append and Remove
  $('#btnEditInsuranceAdd').on('click',function() {
    var editAppend = 
        `<div class="col-12 col-lg-6 addContainer">
            <div class="form-group">
                <label for="editInsurance">Insurance<sup class="text-primary">&#10033;</sup></label>
                <input type="text" class="form-control" id="editInsurance" name="editInsurance" placeholder="Tugboat Insurance">
                <button type="button" class="btn btn-primary btn-sm text-center waves-effect btnRemoveFields mt-2 float-right" data-toggle="tooltip" title="Delete Fields">
                    <i class="fas fa-minus"></i>
                </button>
            </div>
        </div>`;
        if(ctrEdit==3){
            swal({
                title: "Maximum of 3 Additional Fields!",
                type: "error",
                confirmButtonClass: "btn-danger waves-effect",
                confirmButtonText: "Ok",
                closeOnConfirm: false
            });
        }else if(ctrEdit<3){
            $(editAppend).appendTo('#secondRow').addClass( "animated fadeIn fast" ) ;
            ctrEdit++;
        }
  });
  $('#secondRow').on('click',".btnRemoveFields",function(event){
    $(this).closest('.addContainer').fadeOut(200,function(){
      $(this).remove();
      ctrEdit--;
    });
    event.stopImmediatePropagation();
  });
    //Function to show image before upload
    function editfPictureUpload(input) {
      if (input.files && input.files[0]) {
          var editfPicReader = new FileReader();

          editfPicReader.onload = function (e) {
              $('#editfPic').attr('src', e.target.result).fadeIn('slow');
          }
          editfPicReader.readAsDataURL(input.files[0]);
      }
    }
    function editsPictureUpload(input) {
      if (input.files && input.files[0]) {
          var editsPicReader = new FileReader();

          editsPicReader.onload = function (e) {
              $('#editsPic').attr('src', e.target.result).fadeIn('slow');
          }
          editsPicReader.readAsDataURL(input.files[0]);
      }
    }
    function edittPictureUpload(input) {
      if (input.files && input.files[0]) {
          var edittPicReader = new FileReader();

          edittPicReader.onload = function (e) {
              $('#edittPic').attr('src', e.target.result).fadeIn('slow');
          }
          edittPicReader.readAsDataURL(input.files[0]);
      }
    }

    // Prepare the preview for profile picture
  $("#AddfirstPic").change(function(){
    addfPictureUpload(this);
  });

  $("#AddsecPic").change(function(){
      addsPictureUpload(this);
  });

  $("#AddthirdPic").change(function(){
      addtPictureUpload(this);
  });

  // Get Image Name 
  $('#AddfirstPic').change(function(e){
      var fileName = e.target.files[0].name;
      $('#AddfirstFileChosen').text(fileName);
  });
  $('#AddsecPic').change(function(e){
      var fileName = e.target.files[0].name;
      $('#AddsecFileChosen').text(fileName);
  });
  $('#AddthirdPic').change(function(e){
      var fileName = e.target.files[0].name;
      $('#AddthirdFileChosen').text(fileName);
  });


  // Prepare the preview for profile picture
  $("#editFirstPic").change(function(){
    editfPictureUpload(this);
    });

    $("#editSecPic").change(function(){
        editsPictureUpload(this);
    });

    $("#editThirdPic").change(function(){
        edittPictureUpload(this);
    });

    // Get Image Name 
    $('#editFirstPic').change(function(e){
      var fileName = e.target.files[0].name;
      $('#editFirstFileChosen').text(fileName);
  });
  $('#editSecPic').change(function(e){
      var fileName = e.target.files[0].name;
      $('#editSecFileChosen').text(fileName);
  });
  $('#editThirdPic').change(function(e){
      var fileName = e.target.files[0].name;
      $('#editThirdFileChosen').text(fileName);
  });

  //Sweet Alerts!!!
// Go back
$('.btnBack').on('click',function(s) {
  s.preventDefault();
  swal({
      title: "You haven't saved your changes",
      text: "Are you sure you want to go back?",
      type: "error",
      showCancelButton: true,
      confirmButtonClass: "btn-danger waves-effect",
      confirmButtonText: "Ok",
      closeOnConfirm: false
  },
  function(){
    if(window.location.href.indexOf("tugboat.html") > -1) {
      window.location = "tugboat.html"
    }
    else if(window.location.href.indexOf("position.html") > -1) {
    window.location = "position.html"
    }
  });
});

// Add button for all add views
$('.btnAdd').on('click',function() {
  swal({
    title: "New Tugboat Successfully Added!",
    type: "success",
    showCancelButton: false,
    confirmButtonClass: "btn-primary waves-effect",
    confirmButtonText: "Ok",
    closeOnConfirm: false
},
  function(){
      window.location = "tugboat.html"
  });
});

  // Change Sort Text
  $('.sortName').on('click',function() {
    $('.sortDdown').text('Name');
      $('.sortName').addClass('active');
      $('.sortHP').removeClass('active');
  });
  $('.sortHP').on('click',function() {
    $('.sortDdown').text('Horse Power');
      $('.sortHP').addClass('active');
      $('.sortName').removeClass('active');
  });

  // Change to Data Table View
  $('.detView').on('click',function(e) {
      e.preventDefault();
      $('.cardView').css('border-radius', '0px 4.5px 4.5px 0px');
      $('.cardView').removeClass('active');
      $('.detView').addClass('active');
      $('.detLayout').css('display', 'block');
      $('.editLayout').css('display', 'none');
      $('.cardLayout').css('display', 'none');
      $('.sortSelect').css('display', 'none');
  });
  // Change to Card View
  $('.cardView').on('click',function(g) {
      g.preventDefault();
      $('.cardView').css('border-radius', '0px');
      $('.detView').removeClass('active');
      $('.cardView').addClass('active');
      $('.cardLayout').css('display', 'block');
      $('.editLayout').css('display', 'none');
      $('.detLayout').css('display', 'none');
      $('.sortSelect').css('display', 'block');
  });
  // Open Edit from Card
  $('.editItem').on('click',function(e) {
      e.preventDefault();
      $('#infoModal').modal('hide');
      $('.editLayout').css('display', 'block');
      $('.cardLayout').css('display', 'none');
      $('.detLayout').css('display', 'none');
      $('.selectViews').css('display', 'none');
  });
  // Close Modal
  $('.modalClose').on('click',function() {
      $('#infoModal, #viewSummaryModal').modal('hide');
  });
  $('.addCard , .detAdd').on('click',function(e) {
      e.preventDefault();
      $('.addLayout').css('display', 'block');
      $('.editLayout').css('display', 'none');
      $('.cardLayout').css('display', 'none');
      $('.detLayout').css('display', 'none');
      $('.selectViews').css('display', 'none');
  });
  $('.delItem').on('click',function(q) {
      q.preventDefault();
      swal({
          title: "Are you sure?",
          text: "You will not be able to recover Energy Sun.",
          type: "error",
          showCancelButton: true,
          confirmButtonClass: "btn-danger waves-effect",
          confirmButtonText: "Yes, delete it!",
          closeOnConfirm: false
      },
      function(){
          swal("Deleted!", "Energy Sun has been deleted.", "success");
      });
  });

    $('#btnEItemPics').on('click',function(s) {
      s.preventDefault();
      swal({
          title: "Changes won't be undone.",
          text: "Save changes?",
          type: "info",
          showCancelButton: true,
          confirmButtonClass: "btn-primary waves-effect",
          confirmButtonText: "Confirm",
          closeOnConfirm: false
      },
      function(){
          swal("Updated!", "Energy Sun's Pictures has been updated.", "success");
      });
  });
  $('#btnEmInfoSubmit').on('click',function(s) {
      s.preventDefault();
      swal({
          title: "Changes won't be undone.",
          text: "Save changes?",
          type: "info",
          showCancelButton: true,
          confirmButtonClass: "btn-primary",
          confirmButtonText: "Confirm",
          closeOnConfirm: false
      },
      function(){
          swal("Updated!", "Energy Sun's Main Information has been updated.", "success");
      });
  });
    $('#btnETSpecSubmit').on('click',function(s) {
        s.preventDefault();
        swal({
            title: "Changes won't be undone.",
            text: "Save changes?",
            type: "info",
            showCancelButton: true,
            confirmButtonClass: "btn-primary waves-effect",
            confirmButtonText: "Confirm",
            closeOnConfirm: false
        },
        function(){
            swal("Updated!", "Energy Sun's Tugboat Specification has been updated.", "success");
        });
    });
  $('#btnETClassSubmit').on('click',function(s) {
      s.preventDefault();
      swal({
          title: "Changes won't be undone.",
          text: "Save changes?",
          type: "info",
          showCancelButton: true,
          confirmButtonClass: "btn-primary waves-effect",
          confirmButtonText: "Confirm",
          closeOnConfirm: false
      },
      function(){
          swal("Updated!", "Energy Sun's Tugboat Classication has been updated.", "success");
      });
});

});
// Validate if the pictures have the proper file extension
var _validFileExtensions = [".jpg", ".jpeg", ".png"];    
function ValidateSingleInput(oInput) {
if (oInput.type == "file") {
  var sFileName = oInput.files[0].name; ;
    if (sFileName.length > 0) {
      var blnValid = false;
      for (var j = 0; j < _validFileExtensions.length; j++) {
        var sCurExtension = _validFileExtensions[j];
        if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
            blnValid = true;
            break;
        }
      }
      
      if (!blnValid) {
        swal({
          title: "Invalid File Extension!",
          text:"Sorry, " + sFileName + " is invalid. \n Allowed extensions are: " + _validFileExtensions.join(", "),
          type: "error",
          showCancelButton: false,
          confirmButtonClass: "btn-danger waves-effect",
          confirmButtonText: "Ok",
          closeOnConfirm: false
        });
          oInput.value = "";
          return false;
      }
  }
}
  return true;
}

//Function to show image before upload
function editfPictureUpload(input) {
  if (input.files && input.files[0]) {
      var editfPicReader = new FileReader();

      editfPicReader.onload = function (e) {
          $('#editfPic').attr('src', e.target.result).fadeIn('slow');
      }
      editfPicReader.readAsDataURL(input.files[0]);
  }
}
function editsPictureUpload(input) {
  if (input.files && input.files[0]) {
      var editsPicReader = new FileReader();

      editsPicReader.onload = function (e) {
          $('#editsPic').attr('src', e.target.result).fadeIn('slow');
      }
      editsPicReader.readAsDataURL(input.files[0]);
  }
}
function edittPictureUpload(input) {
  if (input.files && input.files[0]) {
      var edittPicReader = new FileReader();

      edittPicReader.onload = function (e) {
          $('#edittPic').attr('src', e.target.result).fadeIn('slow');
      }
      edittPicReader.readAsDataURL(input.files[0]);
  }
}

//Function to show image before upload
function addfPictureUpload(input) {
  if (input.files && input.files[0]) {
      var addfPicReader = new FileReader();

      addfPicReader.onload = function (e) {
          $('#AddfPic').attr('src', e.target.result).fadeIn('slow');
      }
      addfPicReader.readAsDataURL(input.files[0]);
  }
}
function addsPictureUpload(input) {
  if (input.files && input.files[0]) {
      var addsPicReader = new FileReader();

      addsPicReader.onload = function (e) {
          $('#AddsPic').attr('src', e.target.result).fadeIn('slow');
      }
      addsPicReader.readAsDataURL(input.files[0]);
  }
}
function addtPictureUpload(input) {
  if (input.files && input.files[0]) {
      var addtPicReader = new FileReader();

      addtPicReader.onload = function (e) {
          $('#AddtPic').attr('src', e.target.result).fadeIn('slow');
      }
      addtPicReader.readAsDataURL(input.files[0]);
  }
}