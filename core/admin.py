from django.contrib import admin
from core.models import *
    
admin.site.register(Team)

@admin.register(Subscriber)
class SubScriberAdmin(admin.ModelAdmin):
    list_display = ('email','is_active','created_at','updated_at')
    list_filter = ('is_active',)
    search_fields = ('email',)


@admin.register(Contact)
class ContactAdmin(admin.ModelAdmin):
    list_display = ('name','email','subject','message','created_at')
    list_filter = ('name',)
    search_fields = ('name',)

    
