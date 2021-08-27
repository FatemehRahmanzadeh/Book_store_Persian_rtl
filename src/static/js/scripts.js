// const csrftoken = document.querySelector('[name=csrfmiddlewaretoken]').value;
// search using ajax and api
// $(document).ready(function () {
//     $('#srchContent').keydown(function (e)
//     {
//         let $input = $('#srchContent').val();
//         $.ajax({
//             // url: " http://127.0.0.1:8001/books/API/book-list/?search="+$input+"&search_fields=authors&search_fields=title",
//             url: " http://127.0.0.1:8001/books/search/",
//             type: 'POST',
//             dataType: 'json',
//             // headers: {'X-CSRFToken': Cookies.get('csrftoken')},
//             headers: {'X-CSRFToken': csrftoken},
//             data: {'query':$input},
//             success: function (res) {
//                 console.log(res)
//                 PutDataTable(res)
//             }
//         })
//     })
//     function PutDataTable(results){
//
//     }
//     })
//

// add item to session_basket
$(document).on('click', '.add-button', function (e) {
    e.preventDefault();
    var book_id = $(this).data('index');
    $.ajax({
        type: 'POST',
        url: $("#Url-add").attr("data-url"),
        data: {
            book_id: book_id,
            book_qty: $('#num' + book_id).val(),
            action: 'post',
        },
        headers: {'X-CSRFToken': document.querySelector('[name=csrfmiddlewaretoken]').value},
        success: function (jsonData) {
            if (jsonData.qty !== 0) {
                document.getElementById('item-cnt').innerHTML = jsonData.qty
            }
            let $color;
            let $icon;
            if (jsonData.s === 0) {
                $color = 'red'
                $icon = 'fas fa-minus-circle'
            } else {
                $color = 'green'
                $icon = 'fas fa-check'
            }
            iziToast.show({
                color: $color,
                icon: $icon,
                message: jsonData.text_msg,
                messageColor: 'blue',
                timeout: 2000,
            });
        },
        error: function (xhr, errmsg, err) {
        }
    });
})

// Delete session_basket Item
$(document).on('click', '.delete-button', function (e) {
    e.preventDefault();
    var book_id = $(this).data('index');
    $.ajax({
        type: 'POST',
        url: $("#Url-del").attr("data-url"),
        data: {
            book_id: $(this).data('index'),
            action: 'post',


        },
        headers: {'X-CSRFToken': document.querySelector('[name=csrfmiddlewaretoken]').value},
        success: function (json) {
            $('.book-item[data-index="' + book_id + '"]').remove();
            document.getElementById("total").innerHTML = json.total;
            document.getElementById("item-cnt").innerHTML = json.qty;
            iziToast.show({
                color: 'blue',
                icon: 'fas fa-info-circle',
                message: 'سبد خرید بروز شد',
                messageColor: 'green',
                timeout: 2000,
                closeOnClick: true,
                drag: true,
            });
            iziToast.show({
                color: 'blue',
                icon: 'fas fa-info-circle',
                message: 'کتاب از سبد حذف شد',
                messageColor: 'green',
                timeout: 2000,
                closeOnClick: true,
                drag: true,
            });
        },
        error: function (xhr, errmsg, err) {
        }
    });
})

// Update session_basket Item
$(document).on('click', '.update-button', function (e) {
    e.preventDefault();
    var book_id = $(this).data('index');
    $.ajax({
        type: 'POST',
        url: $("#Url-up").attr("data-url"),
        data: {
            book_id: book_id,
            book_qty: $('#num' + book_id).val(),
            action: 'post',
        },
        headers: {'X-CSRFToken': document.querySelector('[name=csrfmiddlewaretoken]').value},
        success: function (json) {
            document.getElementById("total").innerHTML = json.total
            document.getElementById("item-cnt").innerHTML = json.qty
            iziToast.show({
                color: 'blue',
                icon: 'fas fa-info-circle',
                message: 'سبد خرید بروز شد',
                messageColor: 'green',
                timeout: 2000,
                closeOnClick: true,
                drag: true,
            });
        },
        error: function (xhr, errmsg, err) {
        }
    });
})

function showAddPopup(triggeringLink) {
    var name = triggeringLink.id.replace(/^add_/, '');
    href = triggeringLink.href;
    var win = window.open(href, name, 'height=500,width=800,resizable=yes,scrollbars=yes');
    win.focus();
    return false;
}

function closePopup(data) {
    $(id).append('<option value=' + data.address.id + ' selected >' + data.address + '</option>')
    win.close();
}

// edit order address
// $("#edit_author").click(function () {
//     author_name = $("#id_author option:selected").text();
//     var data = {"author_name": author_name};
//     $.ajax({
//         type: 'GET',
//         url: '/author/ajax/get_author_id',
//         data: data,
//         success: function (data) {
//             var url = "/author/" + data['author_id'] + "/edit/";
//             showEditPopup(url);
//         },
//         error: function (data) {
//             alert("Something Went Wrong");
//         }
//     });
// })
// check discount
$(document).on('click', '#disc_btn', function (e) {
    $.ajax({
        type: 'POST',
        url: $("#disc_btn").attr("data-url"),
        data: {
            disc_code: $("#disc-input").val(),
            action: 'post',
        },
        headers: {'X-CSRFToken': document.querySelector('[name=csrfmiddlewaretoken]').value},
        success: function (json) {
            document.getElementById("total-price").innerHTML = json.total
            iziToast.show({
                color: 'blue',
                icon: 'fas fa-info-circle',
                message: json.msg,
                messageColor: 'green',
                timeout: 2000,
                closeOnClick: true,
                drag: true,
            });
        },
        error: function (xhr, errmsg, err) {
            iziToast.show({
                color: 'yellow',
                icon: 'fa fa-exclamation-triangle',
                iconColor: 'red',
                message: errmsg + ':' + err,
                messageColor: 'red',
                timeout: 2000,
                closeOnClick: true,
                drag: true,
            });
        }
    });
})


// check_quantity

// $(document).on('click', '#final-submit', function (e) {
//     $.ajax({
//         type: 'POST',
//         url: $("#disc_btn").attr("data-url"),
//         data: {
//             action: 'check_quantity',
//         },
//         headers: {'X-CSRFToken': document.querySelector('[name=csrfmiddlewaretoken]').value},
//         success: function (json) {
//             if (json.checkes === []) {
//                 iziToast.show({
//                     color: 'blue',
//                     icon: 'fas fa-info-circle',
//                     message: 'تکمیل سفارش',
//                     messageColor: 'green',
//                     timeout: 2000,
//                     closeOnClick: true,
//                     drag: true,
//                 });
//             } else {
//                 $.each( json.checkes, function( key, book ) {
//                     iziToast.show({
//                         color: 'yellow',
//                         icon: 'fas fa-info-circle',
//                         message:'موجود نیست. لطفاٌ سفارش خود را اصلاح کنید' + book + 'کتاب',
//                         messageColor: 'red',
//                         timeout: 2000,
//                         closeOnClick: true,
//                         drag: true,
//                     });
//                 });
//             }
//         },
//         error: function (xhr, errmsg, err) {
//             iziToast.show({
//                 color: 'yellow',
//                 icon: 'fa fa-exclamation-triangle',
//                 iconColor: 'red',
//                 message: errmsg + ':' + err,
//                 messageColor: 'red',
//                 timeout: 2000,
//                 closeOnClick: true,
//                 drag: true,
//             });
//         }
//     });
// })
