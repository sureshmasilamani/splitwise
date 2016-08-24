$(document).ready(function () {
    $('.datepicker').datepicker();
});

$(document).ready(function () {
    $('.all_persons').click(function (val) {
        if ($(this).is(":checked") == true) {
            $('.check_person').prop('checked', true);
            $('.amount').prop('disabled', false);
        }
        else {
            $('.check_person').prop('checked', false);
            $('.amount').prop('disabled', true);
        }
    });

    $('.check_person').click(function (val) {
        if ($(this).is(":checked") == true) {
            $(this).parent().parent().find(".amount").prop('disabled', false);
        }
        else {
            $(this).parent().parent().find(".amount").prop('disabled', true);
        }

    });
})
$(document).ready(function () {
    $('#save').click(function () {
        var sum = 0;
        $(".amount:enabled").each(function () {
            sum += Number($(this).val());
        })

        if ($('#expense_location').val() == "") {
            alert('Please Enter the location');
            return false;
        }
        else if ($('#expense_event_id').val() == "") {
            alert('Please select the event');
            return false;
        }
        else if ($('#expense_exp_date').val() == "") {
            alert('Please Enter the date');
            return false;
        }
        else if (($('#expense_total_amount').val() == "") || ($('#expense_total_amount').val() <= 0)) {
            alert('Please Enter the Total Amount');
            return false;
        }
        else if ($('#expense_location').val() == "") {
            alert('Please Enter the Total Amount');
            return false;
        }
        else if ($('#expense_total_amount').val() != sum) {
            alert('Please Enter the Proper Amount');
            return false;
        }
        else if ($(".amount:enabled").length < 2) {
            alert('Please select min 2 person');
            return false;
        }
        else {
            return true;
        }
    })
})