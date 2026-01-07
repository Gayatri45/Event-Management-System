/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function getWsBranch(companyId, actionUrl, target) {
    if (companyId > 0) {
        $.post('invBranch', {companyId: companyId}, function (data) {
            $('#brId').html(data);
            if ($('#brId').find('option').size() === 2) {
                $('#brId').prop("selectedIndex", 1);
                $(target).html("<center><img src='admin/images/loadInd.gif' class='margin-class'/></center>");
                $.post(actionUrl, {companyId: companyId, branchId: $('#brId').prop("selectedIndex", 1).val()}, function (data) {
                    $(target).html(data);
                });
            }
        });
    } else {
        $('#brId').html("<option value='0'> Select </option>");
        $(target).html("");
    }
}
function loadWeighFrmData(brId, actionUrl, target) {
    $(target).html("<center><img src='admin/images/loadInd.gif' class='margin-class'/></center>");
    $.post(actionUrl, {companyId: $('#compy').val(), branchId: brId}, function (data) {
        $(target).html(data);
    });
}
function loadCustomer(contId, obj) {
    $('#contact_id').val(contId);
    $('#contact_name').val($(obj).text());
}
function calWeigh(obj, type) {
    var myWeigh = 0;
    if ($(obj).val() === '') {
        myWeigh = 0;
    } else {
        myWeigh = $(obj).val();
    }
    if (type === 0) {
        if (parseFloat(myWeigh) > 0) {
            $('#twt').val('');
        }
    }
    if (type === 1) {
        if (parseFloat(myWeigh) > 0) {
            $('#gwt').val('');
        }
    }
}

function subWeighScale() {
    if ($('#compy').val() === "" || $('#compy').val() === null || $('#compy').val() === '0') {
        swal("Oops...", "Please Select Company", "warning");
        return false;
    }
    if ($('#brId').val() === "" || $('#brId').val() === null || $('#brId').val() === '0') {
        swal("Oops...", "Please Select Branch", "warning");
        return false;
    }
    if ($('#rst').val() === "" || $('#rst').val() === null) {
        swal("Oops...", "RST No can't Blank", "warning");
        return false;
    }
    if ($('#vech').val() === "" || $('#vech').val() === null) {
        swal("Oops...", "Vehicle No can't Blank", "warning");
        return false;
    }
    if ($('#contact_id').val() === '0') {
        swal("Oops...", "Please Select Customer Name!", "warning");
        return false;
    }
    if ($('#driname').val() === "" || $('#driname').val() === null) {
        swal("Oops...", "Driver name can't Blank", "warning");
        return false;
    }
    if ($('#drimob').val() === "" || $('#drimob').val() === null) {
        swal("Oops...", "Driver Mobile No is required", "warning");
        return false;
    }

    if (parseFloat($('#gwt').val()) === 0 && parseFloat($('#twt').val()) === 0) {
        swal("Oops...", "Please Enter Gross Weight or Tare Weight. Both can not Blank.", "warning");
        return false;
    }
    if ($('form#wscaleForm').find("input:radio.kit:checked").val() === 'yes') {
        if ($('#contsize').val() === "" || $('#contsize').val() === null) {
            swal("Oops...", "Container Size is required", "warning");
            return false;
        }
        if ($('#contno').val() === "" || $('#contno').val() === null) {
            swal("Oops...", "Container No is required", "warning");
            return false;
        }
       
        if ($('#sealno').val() === "" || $('#sealno').val() === null) {
            swal("Oops...", "Seal No is required", "warning");
            return false;
        }
    }

    $('#progress2').show();
    var formData = new FormData($('form#wscaleForm')[0]);
    $.ajax({
        type: "Post",
        url: "saveWeighScale",
        data: formData,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        success: function (data) {
            if ($(data).find('.errorMessage').size() > 0) {
                swal("Oops...", $(data).find('.errorMessage').text(), "error");
                $('#progress2').hide();
            }
            else {
                swal({
                    title: "",
                    text: $(data).find('.actionMessage').text(),
                    type: "success",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Ok!!",
                    closeOnConfirm: false
                },
                function () {
                    swal("Success !!", $(data).find('.actionMessage').text(), "success");
                });
                $('.swal2-confirm').click(function () {
                    window.location = "pendingweigh";
                });
            }
            $('#progress2').hide();
        }
    });
    return false;
}


function udtWeigh(obj, type) {
    var myWeigh = 0;
    var finwt = 0;
    if ($(obj).val() === '') {
        myWeigh = 0;
    } else {
        myWeigh = $(obj).val();
    }
    if (type === 0) {
        if (parseFloat(myWeigh) > 0) {
            finwt = parseFloat(myWeigh) - parseFloat($('#twt').val());
            $('#netwt').text(finwt);
            $('#udtnetwt').val(finwt);
        } else {
            $('#netwt').text(0);
            $('#udtnetwt').val(0);
        }
    }
    if (type === 1) {
        if (parseFloat(myWeigh) > 0) {
            finwt = parseFloat($('#gwt').val() - parseFloat(myWeigh));
            $('#netwt').text(finwt);
            $('#udtnetwt').val(finwt);
        } else {
            $('#netwt').text(0);
            $('#udtnetwt').val(0);
        }
    }
}
function udtNetWeigh() {
    if ($('#gwt').val() === "" && parseFloat($('#twt').val()) > 0) {
        swal("Oops...", "Please Update Gross Weight!", "warning");
        return false;
    }
    if ($('#twt').val() === "" && parseFloat($('#gwt').val()) > 0) {
        swal("Oops...", "Please Update Tare Weight!", "warning");
        return false;
    }
    var formData = new FormData($('form#udtwscaleForm')[0]);
    $.ajax({
        type: "Post",
        url: "updateWeighScale",
        data: formData,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        success: function (data) {
            if ($(data).find('.errorMessage').size() > 0) {
                swal("Oops...", $(data).find('.errorMessage').text(), "error");
                $('#progress2').hide();
            }
            else {
                swal({
                    title: "",
                    text: $(data).find('.actionMessage').text(),
                    type: "success",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Ok!!",
                    closeOnConfirm: false
                },
                function () {
                    swal("Success !!", $(data).find('.actionMessage').text(), "success");
                });
                $('.swal2-confirm').click(function () {
                    window.location = "completedweigh";
                });
            }
            $('#progress2').hide();
        }
    });
    return false;
}

function subPrevWsScale() {
    if ($('#cust').val() === "" || $('#cust').val() === null) {
        swal("Oops...", "Customer Name can't Blank", "warning");
        return false;
    }
    if ($('#prevrst').val() === "" || $('#prevrst').val() === null) {
        swal("Oops...", "RST No can't Blank", "warning");
        return false;
    }
    if ($('#address').val() === "" || $('#address').val() === null) {
        swal("Oops...", "Address can't Blank", "warning");
        return false;
    }
    if ($('#prevgwt').val() === "") {
        swal("Oops...", "Please Enter Prevoius Gross Weight!", "warning");
        return false;
    }
    if ($('#prevtwt').val() === "") {
        swal("Oops...", "Please Enter Prevoius Tare Weight!", "warning");
        return false;
    }
    if ($('#prevnetwt').val() === "") {
        swal("Oops...", "Net Weight can't Blank!", "warning");
        return false;
    }
    if (parseFloat($('#prevnetwt').val()) < 0) {
        swal("Oops...", "Net Weight can't be negative!", "warning");
        return false;
    }
    if ($('#slip').val() === null || $('#slip').val() === "") {
        swal("Oops...", "Please Enter Prevoius Tare Weight!", "warning");
        return false;
    }
    var formData = new FormData($('form#udtPrevWsForm')[0]);
    $.ajax({
        type: "Post",
        url: "savePrevWeighScale",
        data: formData,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        success: function (data) {
            if ($(data).find('.errorMessage').size() > 0) {
                swal("Oops...", $(data).find('.errorMessage').text(), "error");
                $('#progress2').hide();
            }
            else {
                swal({
                    title: "",
                    text: $(data).find('.actionMessage').text(),
                    type: "success",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Ok!!",
                    closeOnConfirm: false
                },
                function () {
                    swal("Success !!", $(data).find('.actionMessage').text(), "success");
                });
                $('.swal2-confirm').click(function () {
                    window.location = "pendingweigh";
                });
            }
            $('#progress2').hide();
        }
    });
    return false;
}

function calPrevWeigh(obj, type) {
    var myWeigh = 0;
    var finwt = 0;
    var pretare = 0;
    var pregross = 0;
    if ($(obj).val() === '') {
        myWeigh = 0;
    } else {
        myWeigh = $(obj).val();
    }
    if ($('#prevtwt').val() === '') {
        pretare = 0;
    } else {
        pretare = $('#prevtwt').val();
    }
    if ($('#prevgwt').val() === '') {
        pregross = 0;
    } else {
        pregross = $('#prevgwt').val();
    }
    if (type === 0) {
        if (parseFloat(myWeigh) > 0) {
            finwt = parseFloat(myWeigh) - parseFloat(pretare);
            $('#prevnetwt').val(finwt);
        } else {
            $('#prevnetwt').val(0);
        }
    }
    if (type === 1) {
        if (parseFloat(myWeigh) > 0) {
            finwt = parseFloat(pregross) - parseFloat(myWeigh);
            $('#prevnetwt').val(finwt);
        }
        else {
            $('#prevnetwt').val(0);
        }
    }
}