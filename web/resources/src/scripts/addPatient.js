
function Checker(){
    
    //Hard Reset
    $("#Fname").val("");
    $("#Lname").val("");
    $("#email").val("");
    $("#ph").val("");
    $("#address").val("");
    $("#Eph").val("");
    $(".allowed").css('display','none');
    $(".dispFeedBack").text("");
    
    var value = $('#patientIC').val();
    
    if(value==="" || value===null || value.length<=11){
        $("#patientIC").addClass("form-control-warning").removeClass("form-control-danger form-control-success");
        $(".dispFeedBack").text("");
    }
    
    else if(value.length>12){
        
        $("#disp").addClass("has-danger");
        $("#patientIC").addClass("form-control-danger");
        $(".allowed").css('display','none');
        $(".dispFeedBack").text("Not A Valid IC No");
    }
    else{
        
        var data = {IC: value};
        
        $.ajax({

            type:"POST",
            url: "AddPatientCheckIC",
            contentType: "application/json",
            data:JSON.stringify(data),

            success: function(response){
                if(response=='New Patient'){
                    $("#disp").addClass("has-success").removeClass("has-danger has-error");
                    $("#patientIC").addClass("form-control-success").removeClass("form-control-danger form-control-warning");
                    $(".allowed").css('display','block');
                    $(".dispFeedBack").text("New Patient");
                }
                else if(response=='DBSame'){
                    $("#disp").addClass("has-danger").removeClass("has-success has-error");
                    $("#patientIC").addClass("form-control-danger").removeClass("form-control-success form-control-warning");
                    $(".allowed").css('display','none');
                    $(".dispFeedBack").text("Patient Existed!");
                }
                else if(response=='unknown'){
                    $("#disp").addClass("has-danger").removeClass("has-success has-error");
                    $("#patientIC").addClass("form-control-danger").removeClass("form-control-success form-control-warning");
                    $(".allowed").css('display','none');
                    $(".dispFeedBack").text("Please enter only numbers!");
                }
                
                
            }

        });
    }

}

function Submiting(){
    var IC = $("#patientIC").val().trim();
    var Fname = $("#Fname").val();
    var Lname = $("#Lname").val();
    var ph = $("#ph").val().trim();
    var address = $("#address").val();
    var Eph = $("#Eph").val().trim();
    
    if(IC=="" || Fname==""||Lname==""||ph==""||address==""){
        Swal.fire({
            icon: 'error',
            title: 'Puttt...',
            text: 'Put help',
            timer:1500,
            showConfirmButton : false
          });
    }
    else{

        if(Eph==""||Eph==undefined){
            Eph = "";
        }
        Swal.fire({
            title: 'Are you sure?',
            text: "",
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes'
        }).then((result) => {
            if (result.isConfirmed) {

                var params = {
                    IC:IC,
                    Fname:Fname,
                    Lname:Lname,
                    ph:ph,
                    address:address,
                    Eph:Eph
                }

                $.ajax({
                    url : "AddPatient",    
                    method:"POST",     
                    data:JSON.stringify(params),
                    success:function(response){
                        
                        if(response!='qLCk5QxYwCnY7zDsYs9ezFgipHwnk84Fx97J'){

                            Swal.fire({
                                title: 'Patient ' +Fname+' addedd',
                                timer:1500,
                                icon :'success',
                                showConfirmButton : false
                            })

                            $("#patientIC").val("");
                            $("#Fname").val("");
                            $("#Lname").val("");
                            $("#ph").val("");
                            $("#address").val("");
                            $("#Eph").val("");
                            $(".allowed").css('display','none');
                            $(".dispFeedBack").text("");
                            $("#patientIC").addClass("form-control-warning").removeClass("form-control-danger form-control-success");
                            
                        
                        }
                        else{
                            Swal.fire({
                                title: 'An error occured',
                                text:'Please check every input',
                                timer:1500,
                                icon :'warning',
                                showConfirmButton : false
                            })
                        }
                        
                    }
                });


              
              

            }
          })
        
    }
    
}

