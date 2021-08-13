from django import forms
from django.contrib import messages

from core.models import Contact

class ContactForm(forms.ModelForm):
    class Meta:
        model = Contact
        fields = (
            'name',
            'email',
            'subject',
            'message',
        )

        widgets = {
            'name': forms.TextInput(attrs={
                               'placeholder': 'Your name'
                           }),
            'email': forms.EmailInput(attrs={
                                 'placeholder': 'Your email'
                             }),
            'subject': forms.TextInput(attrs={
                                  'placeholder': 'Write subject'
                              }),
            'message': forms.Textarea(attrs={
                                  'placeholder': 'Your message'
                              })
        }

from django.forms import widgets
from .models import Subscriber

class SubScriberForm(forms.ModelForm):
    class Meta:
        model = Subscriber
        fields = '__all__'

        widgets = {
          
            'email':forms.EmailInput(attrs={
            'class':'news__input',
            'placeholder':'Email Adress*',
            }),
        }

