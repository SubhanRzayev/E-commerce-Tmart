from celery import shared_task
from datetime import datetime, timedelta
from django.conf import settings
from django.core.mail import EmailMessage
from products.models import Product
from django.template.loader import render_to_string
from django.conf import settings
from core.models import Subscriber
from django.db.models import Count

@shared_task
def send_mail_to_subscribers():
    subscribers = Subscriber.objects.distinct('email').values_list('email',flat = True)
    last_week = datetime.today()-timedelta(days=7)
    product = Product.objects.filter(created_at__gte=last_week).annotate(num_reviews=Count('review')).order_by('-num_reviews')[:3]



    body = render_to_string('email-subscribers.html', context={
        'products': product,
        'SITE_ADDRESS': settings.SITE_ADDRESS
    })
    msg = EmailMessage(subject='Products News', body=body,
                       from_email=settings.EMAIL_HOST_USER, to=subscribers, )
    msg.content_subtype = 'html'
    msg.send()