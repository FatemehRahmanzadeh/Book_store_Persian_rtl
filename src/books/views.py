from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.db import IntegrityError
from django.db.models import Q
from django.http import HttpResponse
from django.urls import reverse_lazy
from django.views.generic import DetailView, ListView, CreateView, DeleteView, UpdateView

from books.forms import CreateBookForm, CreateCategoryForm
from books.models import Book, Category


class Search(ListView):
    """
    برای جستجو در کتاب ها. کوئری ست بر اساس فیلدهایی که کاربر وارد می کند اورراید شده است.
    """
    model = Book
    template_name = 'books/search.html'
    paginate_by = 10

    def get_queryset(self):
        query = self.request.GET.get('query')
        if query.isdigit():
            return Book.actives.filter(Q(price__lte=query))
        return Book.actives.filter(Q(title__icontains=query) | Q(authors__icontains=query))


class CategoryView(ListView):
    """
    ویوی مشاهده لیست تمام دسته بندی ها
    """
    model = Category
    template_name = 'books/category-list.html'

    def get_queryset(self):
        return super(CategoryView, self).get_queryset().exclude(book_categories__isnull=True)


class CreateCategory(LoginRequiredMixin, UserPassesTestMixin, CreateView):
    """
    ایجاد کتاب توسط کارمند و مدیر.
    """
    permission_denied_message = 'برای ایجاد کتاب دسترسی کارمند و مدی نیاز است.'
    model = Category
    form_class = CreateCategoryForm
    template_name = 'books/new-category.html'

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff

    def form_valid(self, form):
        try:
            instance = form.instance
            instance.creator = self.request.user
            return super(CreateCategory, self).form_valid(form)

        except IntegrityError:
            return HttpResponse('<h1 class="text-danger">دسته وجود دارد!<h1>')

    def get_success_url(self):
        return reverse_lazy('categories')


class DeleteCategoryView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    """
    ویوی حذف دسته بندی انتخابی را ایجاد می کند

    :model: مدل/جدول مرجع
    :template_name: صفحه ای که این ویو در آن رندر می شود
    :success_url: آدرس صفحه ای که بعد موفق بودن حذف کاربر به آن منتقل می شود
    """
    model = Category
    template_name = 'books/ctg_delete.html'
    success_url = reverse_lazy('categories')

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff


class EditCategoryView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    """
    ویرایش دسته بندی
    """
    model = Category
    template_name = 'books/edit-category.html'
    form_class = CreateCategoryForm

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff

    def get_success_url(self):
        return reverse_lazy('categories')

    def form_valid(self, form):
        try:
            instance = form.instance
            instance.last_edited_by = self.request.user
            return super(EditCategoryView, self).form_valid(form)

        except IntegrityError:
            return HttpResponse('<h1 class="text-danger">دسته با این نام وجود دارد!<h1>')


class CategoryDetail(DetailView):
    """
    ویوی مشاهده تمام کتابهای یک دسته بندی. این ویو در تمپلیت سرچ رندر می شود و کاربر امکان افزودن به سبد خرید را از این ویو نیز دارد.
    """
    model = Category
    template_name = 'books/search.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        slug = self.kwargs.get('slug')
        try:
            context['object_list'] = Book.objects.filter(categories__slug=slug)
        except Book.DoesNotExist:
            context['object_list'] = None
        return context


class CreateBook(LoginRequiredMixin, UserPassesTestMixin, CreateView):
    """
    ایجاد کتاب توسط کارمند و مدیر.
    """
    permission_denied_message = 'برای ایجاد کتاب دسترسی کارمند و مدی نیاز است.'
    model = Book
    form_class = CreateBookForm
    template_name = 'books/new-book.html'

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff

    def form_valid(self, form):
        try:
            instance = form.save(commit=False)
            instance.creator = self.request.user
            return super(CreateBook, self).form_valid(form)

        except IntegrityError:
            return HttpResponse('<h1 class="text-danger">کتاب وجود دارد!<h1>')

    def get_success_url(self):
        return reverse_lazy('detail', args=[str(self.object.slug)])


class DeleteBookView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    """
    ویوی حذف یک کتاب
    """
    model = Book
    template_name = 'books/book_delete.html'
    success_url = reverse_lazy('categories')

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff

    def get_success_url(self):
        return reverse_lazy('home')


class BookDetail(DetailView):
    """
    ویوی جزییات کتاب
    """
    model = Book
    template_name = 'books/book-detail.html'


class EditBook(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    """
    ویرایش مشخصات کتاب
    """
    model = Book
    form_class = CreateBookForm
    template_name = 'books/edit_book.html'

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff

    def form_valid(self, form):
        try:
            instance = form.save(commit=False)
            instance.last_edit_by = self.request.user
            instance.save()
            return super(EditBook, self).form_valid(form)

        except IntegrityError:
            return HttpResponse('<h1 class="text-danger">کتاب وجود دارد!<h1>')

    def get_success_url(self):
        return reverse_lazy('detail', args=[str(self.object.slug)])


class BookList(LoginRequiredMixin, UserPassesTestMixin, ListView):
    model = Book
    template_name = 'books/book_list.html'

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff
