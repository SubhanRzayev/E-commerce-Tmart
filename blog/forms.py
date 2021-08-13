from django import forms
from django.db.models import fields
from django.forms import widgets
from .models import Comment


class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = (
            'name',
            'email',
            'message',
        )
        widgets = {

            'name':forms.TextInput(attrs={
            'class':'rfb-single-input',
            'placeholder':'Name*',
            }),
        
            'email':forms.EmailInput(attrs={
                'class':'rfb-single-input',
                'placeholder':'Email*',
            }),

            'message': forms.Textarea(attrs={
                'class':'rfb-single-input',
                'placeholder':'Message*',
            }),
        }


  
