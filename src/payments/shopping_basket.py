from books.models import Book


class Basket():
    """
    .یک کلاس پایه برای سبد خرید با رفتارهای پیشفرضی که می تواند در صورت لزوم ارث بری یا بازنویسی شود
    به محض اینکه کاربری وارد سایت شد فرقی ندارد چه صفحه ای، این کلاس یک سشن برای
     او می سازد یا اینکه با خواندن کوکی از مرورگر کاربر، سبد خرید او را از جدول سشن
     خوانده و در اتریبیوت بسکت نگه میدارد که بتواند کتاب هایی را به سبد خرید خود اضافه کند.
    """

    def __init__(self, request):
        self.session = request.session
        basket = self.session.get('session_key')
        if 'session_key' not in request.session:
            basket = self.session['session_key'] = {}
        self.basket = basket

    def add(self, book, qty):
        """
         اضافه کردن کتاب جدید به سبد خرید کاربر و یا بروزرسانی آن
        """
        book_id = book.id
        if book_id in self.basket:
            self.basket[book_id]['quantity'] = qty
        else:
            self.basket[book.id] = {'price': book.get_final_price(), 'quantity': qty}

        self.save()

    def __iter__(self):
        """
        برای خواندن دیتای مربوط به سبد خرید از دیتابیس پیمایش در لیست دیتا ها
        """
        book_ids = self.basket.keys()
        basket_books = Book.actives.filter(id__in=book_ids)
        basket = self.basket.copy()
        for book in basket_books:
            basket[str(book.id)]['book'] = book

        for item in basket.values():
            item['total_price'] = item['price'] * item['quantity']
            yield item
        return basket

    def __len__(self):
        """
        برای گرفتن آیتم های داخل سبد خرید و شمارش تعداد آن ها
        """
        return sum(item['quantity'] for item in self.basket.values())

    def get_total_price(self):
        return sum(item['price'] * item['quantity'] for item in self.basket.values())

    def update(self, book, qty):
        """
        Update values in session data
        """
        book_id = str(book)
        if book_id in self.basket:
            self.basket[book_id]['quantity'] = qty
        self.save()

    def delete(self, book):
        """
        Delete item from session data
        """
        book_id = str(book)

        if book_id in self.basket:
            del self.basket[book_id]
            print(book_id)
            self.save()

    def save(self):
        self.session.modified = True
