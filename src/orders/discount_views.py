from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.db import IntegrityError
from django.http import HttpResponse
from django.urls import reverse_lazy
from django.views.generic import CreateView, UpdateView, DeleteView, ListView

from orders.forms import DiscountCodeForm, PercentOffForm, CashOffForm
from orders.models import DiscountCode, PercentOff, CashOff


# تخفیف سبد خرید، کدتخفیف
class DiscountCodeList(LoginRequiredMixin, UserPassesTestMixin, ListView):
    """
    لیست همه تخفیف ها
    """
    model = DiscountCode
    context_object_name = 'discount_code'
    template_name = 'payments/discounts/discount_code_list.html'

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff


class CreateDiscountCode(LoginRequiredMixin, UserPassesTestMixin, CreateView):
    model = DiscountCode
    template_name = 'payments/discounts/new_discount_code.html'
    form_class = DiscountCodeForm

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff

    def get_success_url(self):
        return reverse_lazy('accounts:staff-panel', args=[str(self.self.request.user.slug)])

    def form_valid(self, form):
        try:
            instance = form.save(commit=False)
            instance.creator = self.request.user
            return super(CreateDiscountCode, self).form_valid(form)

        except IntegrityError:
            return HttpResponse('<h1 class="text-danger">تخفیف وجود دارد!<h1>')


class EditDiscountCode(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    """
    ویرایش مشخصات تخفیف
    """
    model = DiscountCode
    form_class = DiscountCodeForm
    template_name = 'payments/discounts/edit_discount_code.html'

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff

    def form_valid(self, form):
        try:
            instance = form.save(commit=False)
            instance.last_edited_by = self.request.user
            return super(EditDiscountCode, self).form_valid(form)

        except IntegrityError:
            return HttpResponse('<h1 class="text-danger">تخفیف وجود دارد!<h1>')

    def get_success_url(self):
        return reverse_lazy('accounts:staff-panel', args=[str(self.request.user.slug)])


class DeleteDiscountCode(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    """
    ویوی حذف یک کد تخفیف
    """
    model = DiscountCode
    template_name = 'payments/discounts/delete_discount.html'

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff

    def get_success_url(self):
        return reverse_lazy('accounts:staff-panel', args=[str(self.request.user.slug)])


# تخفیف کتاب، تخفیف درصدی
class PercentOffList(LoginRequiredMixin, UserPassesTestMixin, ListView):
    """
    لیست همه تخفیف ها
    """
    model = PercentOff
    template_name = 'payments/discounts/discount_percent_list.html'
    context_object_name = 'discount_percent'

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff


class CreatePercentOff(LoginRequiredMixin, UserPassesTestMixin, CreateView):
    model = PercentOff
    template_name = 'payments/discounts/new_discount_code.html'
    form_class = PercentOffForm

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff

    def get_success_url(self):
        return reverse_lazy('accounts:staff-panel', args=[str(self.request.user.slug)])

    def form_valid(self, form):
        try:
            instance = form.instance
            instance.creator = self.request.user
            return super(CreatePercentOff, self).form_valid(form)

        except IntegrityError:
            return HttpResponse('<h1 class="text-danger">تخفیف وجود دارد!<h1>')


class EditPercentOff(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    """
    ویرایش مشخصات تخفیف
    """
    model = PercentOff
    form_class = PercentOffForm
    template_name = 'payments/discounts/edit_discount_code.html'

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff

    def form_valid(self, form):
        try:
            instance = form.save(commit=False)
            instance.last_edited_by = self.request.user
            return super(EditPercentOff, self).form_valid(form)

        except IntegrityError:
            return HttpResponse('<h1 class="text-danger">تخفیف وجود دارد!<h1>')

    def get_success_url(self):
        return reverse_lazy('accounts:staff-panel', args=[str(self.request.user.slug)])


class DeletePercentOff(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    """
    ویوی حذف یک کد تخفیف
    """
    model = PercentOff
    template_name = 'payments/discounts/delete_discount.html'

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff

    def get_success_url(self):
        return reverse_lazy('accounts:staff-panel', args=[str(self.request.user.slug)])


# تخفیف نقدی
class CashOffList(LoginRequiredMixin, UserPassesTestMixin, ListView):
    """
    لیست همه تخفیف ها
    """
    model = CashOff
    template_name = 'payments/discounts/discount_cash_list.html'
    context_object_name = 'discount_cash'

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff


class CreateCashOff(LoginRequiredMixin, UserPassesTestMixin, CreateView):
    model = CashOff
    template_name = 'payments/discounts/new_discount_code.html'
    form_class = CashOffForm

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff

    def get_success_url(self):
        return reverse_lazy('accounts:staff-panel', args=[str(self.request.user.slug)])

    def form_valid(self, form):
        try:
            instance = form.instance
            instance.creator = self.request.user
            return super(CreateCashOff, self).form_valid(form)

        except IntegrityError:
            return HttpResponse('<h1 class="text-danger">تخفیف وجود دارد!<h1>')


class EditCashOff(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    """
    ویرایش مشخصات تخفیف
    """
    model = CashOff
    form_class = CashOffForm
    template_name = 'payments/discounts/edit_discount_code.html'

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff

    def form_valid(self, form):
        try:
            instance = form.save(commit=False)
            instance.last_edited_by = self.request.user
            return super(EditCashOff, self).form_valid(form)

        except IntegrityError:
            return HttpResponse('<h1 class="text-danger">تخفیف وجود دارد!<h1>')

    def get_success_url(self):
        return reverse_lazy('accounts:staff-panel', args=[str(self.request.user.slug)])


class DeleteCashOff(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    """
    ویوی حذف یک کد تخفیف
    """
    model = CashOff
    template_name = 'payments/discounts/delete_discount.html'

    def test_func(self):
        """
            این تابع چک می کند که کاربر درخواست دهنده حتما دسترسی کارمند داشته باشد.
        """
        return self.request.user.is_staff

    def get_success_url(self):
        return reverse_lazy('accounts:staff-panel', args=[str(self.request.user.slug)])
