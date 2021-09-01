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

function closePopup(win, new_id, new_addr, id) {
    $(id).append('<option id=id value=' + new_id + ' selected >' + new_addr + '</option>')
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
var addrCard = document.getElementById('addr-card')
var addrList = document.getElementById('addr-list')
addrCard.style.display = "none";
// show customer addresses
$(document).on('click', '#show-addr', function (e) {
    if (addrCard.style.display === "none") {
        addrList.innerHTML = '';
        addrCard.style.display = "block";
    } else {
        addrList.innerHTML = '';
        addrCard.style.display = "none";
    }
    $.ajax({
        type: 'GET',
        url: $("#show-addr").attr("data-url"),
        success: function (json) {

            json.addresses.forEach(function (item) {
                let li = createAddressLi(item)
                $('#addr-list').append(li)
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

function createAddressLi(item) {
    let li = document.createElement('li');
    li.className = "list-group-item d-flex justify-content-between align-items-center flex-wrap";
    let address;
    address = item.province + ',' + item.city + ',' + item.street + ',' + item.details + ',' + '(' + 'کدپستی:' + item.postcode + ')';
    li.appendChild(document.createTextNode(address));
    if (item.is_default === true) {
        let i = document.createElement('i');
        i.className = "fa fa-check text-success"
        i.appendChild(document.createTextNode('اصلی'))
        li.appendChild(i);
    }
    li.appendChild(delAddress(item.id))
    return li
}

// create delete button for addresses
function delAddress(item_id) {
    let del = document.createElement('i');
    del.className = "del fa fa-trash btn btn-danger";
    del.id = 'addr' + item_id;
    del.attributes['aria-hidden'] = true;
    del.dataset.idDel = item_id;
    del.dataset.urlDel = '/accounts/address/' + item_id + '/delete/';
    del.title = 'حذف';
    return del
}

// ajax call for delete address
$(document).on('click', '.del', function (e) {
    var addLi = this.parentElement
    $.ajax({
        type: 'POST',
        url: this.dataset.urlDel,
        headers: {'X-CSRFToken': document.querySelector('[name=csrfmiddlewaretoken]').value},
        success: function (json) {
            if (json.success === true) {
                addLi.remove()
                iziToast.show({
                    color: 'blue',
                    icon: 'fas fa-info-circle',
                    message: json.msg,
                    messageColor: 'green',
                    timeout: 2000,
                    closeOnClick: true,
                    drag: true,
                });
            } else {
                iziToast.show({
                    color: 'yellow',
                    icon: 'fa fa-exclamation-triangle',
                    iconColor: 'red',
                    message: json.error,
                    messageColor: 'red',
                    timeout: 2000,
                    closeOnClick: true,
                    drag: true,
                });
            }
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
