// const csrftoken = document.querySelector('[name=csrfmiddlewaretoken]').value;
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
        url:$("#Url-add").attr("data-url"),
        data: {
            book_id: book_id,
            book_qty: $('#num' + book_id).val(),
            action: 'post',
        },
        headers: {'X-CSRFToken': document.querySelector('[name=csrfmiddlewaretoken]').value},
        success: function (jsonData) {
            document.getElementById('item-cnt').innerHTML = jsonData.qty
            let $color;
            let $icon;
            if (jsonData.s === 0) {
                $color = 'red'
                $icon = 'fas fa-minus-circle'
            } else{
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
  error: function (xhr, errmsg, err) {}
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
    book_qty: $('#num'+ book_id).val(),
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
  error: function (xhr, errmsg, err) {}
});
})