from django.http import JsonResponse
from django.shortcuts import get_object_or_404, render

from books.models import Book
from orders.models import DefaultBasket
from session_basket.shopping_basket import Basket as SBasket


def basket_summary(request):
    basket = SBasket(request)
    return render(request, 'payments/orders/summary.html', {'basket': basket})


def add_to_basket(request):
    basket = SBasket(request)
    if request.POST.get('action') == 'post':
        book_id = int(request.POST.get('book_id'))
        book_qty = int(request.POST.get('book_qty'))
        book = get_object_or_404(Book, id=book_id)

        if request.user.is_authenticated:
            logged_in_basket = DefaultBasket.objects.get(customer=request.user)
            order = logged_in_basket.add(book=book, qty=book_qty)
            order.save()
            text_msg = 'کتاب با موفقیت به سبد اضافه شد'
            qty = sum(_.quantity for _ in order.order_items.all())
            response = JsonResponse({'text_msg': text_msg, 's': 1, 'qty': qty})

        else:
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
        if request.user.is_authenticated:
            logged_in_basket = DefaultBasket.objects.get(customer=request.user)
            order = logged_in_basket.delete_item(item_id=book_id)
            qty = sum(_.quantity for _ in order.order_items.all())
            response = JsonResponse({'total': order.get_order_price(), 'qty': qty})
        else:
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

        if request.user.is_authenticated:
            logged_in_basket = DefaultBasket.objects.get(customer=request.user)
            order = logged_in_basket.update(item=book_id, qty=book_qty)
            order.save()
            text_msg = 'سفارش با موفقیت بروز شد'
            qty = sum(_.quantity for _ in order.order_items.all())
            response = JsonResponse({'total': order.get_order_price(), 's': 1, 'qty': qty})
        else:
            basket.update(book=book_id, qty=book_qty)

            basket_qty = basket.__len__()
            basket_total = basket.get_total_price()
            response = JsonResponse({'qty': basket_qty, 'total': basket_total})
        return response
