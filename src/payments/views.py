from django.http import JsonResponse
from django.shortcuts import get_object_or_404, render
# from django.views.generic import ListView

from books.models import Book
# from payments.models import Order
from payments.shopping_basket import Basket as SBasket


# class OrderSummary(ListView):
#     model = Order
#     template_name = 'payments/orders/summary.html'
#
#

def basket_summary(request):
    basket = SBasket(request)
    return render(request, 'payments/orders/summary.html', {'basket':basket})


def add_to_basket(request):
    basket = SBasket(request)
    if request.POST.get('action') == 'post':
        book_id = int(request.POST.get('book_id'))
        book_qty = int(request.POST.get('book_qty'))
        book = get_object_or_404(Book, id=book_id)
        basket.add(book=book, qty=book_qty)
        if book.quantity == 0:
            text_msg = 'متاسفانه درحال حاضر کتاب موجود نیست '
            status = 0
        else:
            basket.add(book=book, qty=book_qty)
            status = 1
            text_msg = 'کتاب با موفقیت به سبد اضافه شد'
        basket_qty = basket.__len__()
        response = JsonResponse({'qty': basket_qty, 'text_msg': text_msg, 's': status})
        return response


def basket_delete(request):
    basket = SBasket(request)
    if request.POST.get('action') == 'post':
        book_id = int(request.POST.get('book_id'))
        basket.delete(book=book_id)

        basket_qty = basket.__len__()
        basket_total = basket.get_total_price()
        response = JsonResponse({'qty': basket_qty, 'total': basket_total})
        return response


def basket_update(request):
    basket = SBasket(request)
    if request.POST.get('action') == 'post':
        book_id = int(request.POST.get('book_id'))
        book_qty = int(request.POST.get('book_qty'))
        basket.update(book=book_id, qty=book_qty)

        basket_qty = basket.__len__()
        basket_total = basket.get_total_price()
        response = JsonResponse({'qty': basket_qty, 'total': basket_total})
        return response
