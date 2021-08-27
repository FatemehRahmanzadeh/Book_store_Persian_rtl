from django.contrib import admin
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin
from accounts.models import Address, AdminProxy, CustomerProxy, StaffProxy


class CustomerAdmin(UserAdmin):
    fieldsets = (
        ('اطلاعات اولیه',
         {'fields': ('email', 'password',)}),
        ('سایر اطلاعات شخصی', {'fields': ('username', 'first_name', 'last_name',)}),
        ('مجوز های گروهی', {
            'classes': ('collapse',),
            'fields': ('is_active', 'groups', 'user_permissions',)
        })
    )
    add_fieldsets = UserAdmin.add_fieldsets + (
        (None, {'fields': ('email', 'is_active')}),
    )
    list_display = ['email', 'first_name', 'last_name']

    def get_queryset(self, request):
        return get_user_model().objects.filter(is_staff=False)


class StaffAdmin(UserAdmin):
    fieldsets = (
        ('اطلاعات اولیه',
         {'fields': ('email', 'password',)}),
        ('سایر اطلاعات شخصی', {'fields': ('username', 'first_name', 'last_name',)}),
        ('مجوز های گروهی', {
            'classes': ('collapse',),
            'fields': ('is_staff', 'is_superuser', 'is_active', 'groups', 'user_permissions',)
        })
    )
    add_fieldsets = UserAdmin.add_fieldsets + (
        (None, {'fields': ('email', 'is_staff')}),
    )
    list_display = ['id', 'email', 'username', 'is_staff']

    def get_queryset(self, request):
        return get_user_model().objects.filter(is_staff=True, is_superuser=False)


class AdminAdmin(UserAdmin):
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


class AddressAdmin(admin.ModelAdmin):
    fields = ('postcode', 'is_default', 'customer', 'province', 'city', 'street', 'details')


admin.site.register(AdminProxy, AdminAdmin)
admin.site.register(CustomerProxy, CustomerAdmin)
admin.site.register(StaffProxy, StaffAdmin)
admin.site.register(Address, AddressAdmin)
