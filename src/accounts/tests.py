from django.contrib.auth import get_user_model
from django.test import TestCase


class CustomUserTests(TestCase):
    """
    تست کیس دو متد ایجاد یوزر و سوپریوزر از مدل کاستوم یوزر
    """

    def test_create_user(self):
        """
        ایجاد یوزر تنها با ایمیل و پسورد. چک می کند که فیلدهای:
        is_active
        حتما
        true
        و
        issuperuser, is_staff
        حتما
        false
        باشد
        """
        User = get_user_model()
        user = User.objects.create(
            email='fatemeh@email.com',
            password='customusertest12345')
        self.assertEqual(user.email, 'fatemeh@email.com')
        self.assertTrue(user.is_active)
        self.assertFalse(user.is_staff)
        self.assertFalse(user.is_superuser)

    def test_create_superuser(self):
        """
        ایجاد ادمین با استفاده از ایمیل و پسورد. چک می کند که فیلد های
        issuperuser, is_staff
        حتما
        true
        باشد
        """
        User = get_user_model()

        admin = User.objects.create_superuser(
            email='admin@email.com',
            password='fatemeh70'
        )
        self.assertEqual(admin.email, 'admin@email.com')
        self.assertTrue(admin.is_superuser)
        self.assertTrue(admin.is_staff)
        self.assertTrue(admin.is_active)
