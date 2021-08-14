from django.contrib import admin
from django.contrib.auth import get_user_model
from accounts.models import Address, CustomerProxy, StaffProxy, AdminProxy


@admin.register(CustomerProxy)
class CustomerAdmin(admin.ModelAdmin):
    fieldsets = (
        ('اطلاعات اولیه',
         {'fields': ('email', 'password',)}),
        ('سایر اطلاعات شخصی', {'fields': ('username', 'first_name', 'last_name',)}),
        ('مجوز های گروهی', {
            'classes': ('collapse',),
            'fields': ('is_active', 'groups', 'user_permissions',)
        })
    )

    def get_queryset(self, request):
        return get_user_model().objects.filter(is_staff=False)


@admin.register(StaffProxy)
class StaffAdmin(admin.ModelAdmin):
    fieldsets = (
        ('اطلاعات اولیه',
         {'fields': ('email', 'password',)}),
        ('سایر اطلاعات شخصی', {'fields': ('username', 'first_name', 'last_name',)}),
        ('مجوز های گروهی', {
            'classes': ('collapse',),
            'fields': ('is_staff', 'is_superuser', 'is_active', 'groups', 'user_permissions',)
        })
    )

    def get_queryset(self, request):
        return get_user_model().objects.filter(is_staff=True, is_superuser=False)


@admin.register(AdminProxy)
class AdminAdmin(admin.ModelAdmin):
    fieldsets = (
        ('اطلاعات اولیه',
         {'fields': ('email', 'password',)}),
        ('سایر اطلاعات شخصی', {'fields': ('username', 'first_name', 'last_name',)}),
        ('مجوز های گروهی', {
            'classes': ('collapse',),
            'fields': ('is_staff', 'is_superuser', 'is_active', 'groups', 'user_permissions',)
        })
    )

    def get_queryset(self, request):
        return get_user_model().objects.filter(is_staff=True, is_superuser=True)


@admin.register(Address)
class AddressAdmin(admin.ModelAdmin):
    fields = ('post_code', 'is_default', 'customer')

