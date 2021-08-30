from django import forms

from books.models import Book, Category


class CreateBookForm(forms.ModelForm):
    class Meta:
        model = Book
        fields = "__all__"
        exclude = ['creator', 'last_edit_by', 'slug']


class CreateCategoryForm(forms.ModelForm):
    class Meta:
        model = Category
        fields = "__all__"
        exclude = ['creator', 'last_edit_by', 'slug']
