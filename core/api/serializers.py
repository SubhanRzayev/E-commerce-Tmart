
from rest_framework import serializers

from django.db.models import fields
from core.models import Subscriber


class SubscriberSerializer(serializers.ModelSerializer):
    class Meta:
        model = Subscriber
        fields = (
            'email',
        )


 