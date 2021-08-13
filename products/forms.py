from django import forms
from django.contrib import messages

from products.models import Review


class ReviewForm(forms.ModelForm):
    class Meta:
        model = Review
        fields = (
            'product',
            'rate',
            'name',
            'email',
            'message',
        )
        
        widgets = {
            'product' : forms.TextInput(attrs={
                            'type': 'hidden',
                        }),
            'rate' : forms.TextInput(attrs={
                            'class': 'form-control',
                            'placeholder': 'Your rate'
                        }),
            'name': forms.TextInput(attrs={
                            'class': 'form-control',
                            'placeholder': 'Your name'
                        }),
            'email': forms.EmailInput(attrs={
                                'class': 'form-control',
                                'placeholder': 'Your email'
                            }),
            'message': forms.Textarea(attrs={   
                                'class': 'form-control',
                                'placeholder': 'Your message'
                            }),
            }

    def clean_product(self):
        product = self.cleaned_data['product']
        print(product,"********************")
        return product
    