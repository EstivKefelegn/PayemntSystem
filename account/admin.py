from django.contrib import admin
from .models import Account, KYC

# Register your models here.
@admin.register(Account)
class AccountAdmin(admin.ModelAdmin):
    list_display = ['user', 'account_number', 'account_status', 'account_balance']
    list_editable = ['account_status', 'account_balance']
    list_filter = ['account_status']

@admin.register(KYC)
class KYCAdmin(admin.ModelAdmin):
    search_fields = ["fullname"]
    list_display = ["user", "fullname"]