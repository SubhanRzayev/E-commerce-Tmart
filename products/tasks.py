import time
from datetime import datetime, timedelta
import dateutil.relativedelta

from celery import shared_task
from products.models import Product, User
from django.template.loader import render_to_string
from django.core.mail import EmailMessage
from django.conf import settings
from django.db.models import Count

# @shared_task
# def dump():
#     print("Here")
#     dump()
#     print("End")

@shared_task
def send_mail_to_users():
    user = User.objects.all().values_list('email', flat=True)

    month = datetime.today() - timedelta(days=30)

    products = Product.objects.filter(created_at__gte=month).annotate(reviews_count = Count('comments')).order_by('-reviews_count')[:5]

    content = render_to_string('monthly-notifications.html', context={
        'product_detail': products,
        # 'SITE_ADDRESS': settings.SITE_ADDRESS
    })
    msg = EmailMessage(subject="New products", body=content,
                        from_email=settings.EMAIL_HOST_USER, bcc=user)
    
    msg.content_subtype = 'html'
    msg.send()