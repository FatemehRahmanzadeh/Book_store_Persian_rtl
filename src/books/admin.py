from django.contrib import admin

from books.models import Book, Category


@admin.register(Book)
class BookAdmin(admin.ModelAdmin):
    fields = ['title', 'categories', 'authors', 'description', 'quantity',
              'price', 'image', 'percent_off', 'max_cash_off', 'creator',
              'last_edit_by', 'created_at', 'updated_at', 'is_active']

    readonly_fields = ('created_at', 'updated_at',)

    list_display = ['title', 'quantity', 'price', 'creator', 'last_edit_by', 'get_final_price']
    list_editable = ['quantity', 'price',]

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name in ['creator', 'last_edit_by']:
            # انتخاب کاربر درخواست دهنده به عنوان ایجادککنده یا ویرایشگر کتاب
            kwargs['initial'] = request.user.id
            # تغییر فیلد به فقط خواندنی
            kwargs['disabled'] = True

        return super().formfield_for_foreignkey(db_field, request, **kwargs)


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    fields = ['name', 'creator', 'last_edit_by', 'created_at', 'updated_at']

    readonly_fields = ('created_at', 'updated_at',)

    list_display = ['name', 'creator', 'last_edit_by']

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name in ['creator', 'last_edit_by']:
            # انتخاب کاربر درخواست دهنده به عنوان ایجادکننده یا ویرایشگر دسته
            kwargs['initial'] = request.user.id
            # تغییر فیلد به فقط خواندنی
            kwargs['disabled'] = True

        return super().formfield_for_foreignkey(db_field, request, **kwargs)
