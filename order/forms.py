from django import forms
from order.models import ShippingAddress


class ShippingAddres(forms.ModelForm):
    class Meta:
        model = ShippingAddress
        fields = (
            'address',
            'city', 
            'state',
            'zipcode', 
            'companyname', 
            'date_added',
        )
        
        widgets = {
            
            'address': forms.Textarea(attrs={   
                                'class': 'form-control',
                                'placeholder': 'Address'
                            }),

            'city': forms.Textarea(attrs={   
                                'class': 'form-control',
                                'placeholder': 'City'
                            }),
            
            'state': forms.TextInput(attrs={   
                                'class': 'form-control',
                                'placeholder': 'State'
                            }),
            'zipcode': forms.TextInput(attrs={   
                                'class': 'form-control',
                                'placeholder': 'Zipcode'
                            }),
            'companyname': forms.TextInput(attrs={   
                                'class': 'form-control',
                                'placeholder': 'Company name'
                            }),
            }