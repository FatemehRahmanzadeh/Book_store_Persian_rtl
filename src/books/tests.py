from django.test import TestCase

# Create your tests here.
from django.urls import reverse

from accounts.models import CustomUser
from books.models import Book, Category


class TestUpdateBook(TestCase):
    def test_book_update(self):
        creator = CustomUser.objects.create(email='user@email.com', password='fatemeh70', is_staff=True)

        book = Book.objects.create(title='اثرسایه', authors='دبی فورد', quantity=10, price=45000, creator=creator)
        response = self.client.post(
            reverse('edit-book', kwargs={'slug': book.slug}),
            {'title': 'اثرسایه',
             'authors': 'دبی فورد',
             'quantity': 10,
             'price': 45000,
             'creator': creator}
        )
        self.assertEqual(response.status_code, 302)
        book.refresh_from_db()
        self.assertEqual(book.title, 'اثرسایه')
