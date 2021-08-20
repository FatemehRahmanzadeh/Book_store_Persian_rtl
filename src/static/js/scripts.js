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

// add item to basket
$(document).on('click', '.add-button', function (e) {
    e.preventDefault();
    $.ajax({
        type: 'POST',
        url: ' http://127.0.0.1:8001/payments/add-to-basket/',
        data: {
            book_id: $('.add-button').val(),
            book_qty: $('.num').val(),
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

// Delete basket Item
$(document).on('click', '.delete-button', function (e) {
e.preventDefault();
var prodid = $(this).data('index');
$.ajax({
  type: 'POST',
  url: '{% url "basket:basket_delete" %}',
  data: {
    productid: $(this).data('index'),
    csrfmiddlewaretoken: "{{csrf_token}}",
    action: 'post'
  },
  success: function (json) {
    $('.product-item[data-index="' + prodid + '"]').remove();
    document.getElementById("total").innerHTML = json.total;
    document.getElementById("basket-qty").innerHTML = json.qty
  },
  error: function (xhr, errmsg, err) {}
});
})

// Update basket Item
$(document).on('click', '.update-button', function (e) {
e.preventDefault();
var prodid = $(this).data('index');
$.ajax({
  type: 'POST',
  url: '{% url "basket:basket_update" %}',
  data: {
    productid: $(this).data('index'),
    productqty: $('#select' + prodid + ' option:selected').text(),
    csrfmiddlewaretoken: "{{csrf_token}}",
    action: 'post'
  },
  success: function (json) {
    document.getElementById("basket-qty").innerHTML = json.qty
    document.getElementById("total").innerHTML = json.total
  },
  error: function (xhr, errmsg, err) {}
});
})