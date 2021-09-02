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
        exclude = ['creator', 'last_edit_by', 'slug', 'created_at']

    def __init__(self, *args, **kwargs):
        super(CreateCategoryForm, self).__init__(*args, **kwargs)
        queryset = Book.objects.all()
        self.fields['book_categories'] = forms.ModelMultipleChoiceField(queryset=queryset, label='کتاب های دسته')

    def save(self, *args, **kwargs):
        self.instance.save()
        for book in self.cleaned_data.get('book_categories'):
            book.categories.add(self.instance)
            book.save()
        return super(CreateCategoryForm, self).save(*args, **kwargs)
