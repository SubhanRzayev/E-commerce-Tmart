# from django.test import TestCase
# from products.forms import ReviewForm

# class ReviewFormTest(TestCase):
    
#     @classmethod
#     def setUpClass(cls):
#         cls.valid_data = {
#             'name': 'Kamal ',
#             'email': 'kamal@gmail.com',
#             'rate': '1',
#             'message': 'Ana sehifeden login sehifesine daxil ola bilmirem'
#         }   

#         cls.invalid_data = {
#             'email': 'tmart@gmail.com',
#             'rate': '2',
#             'message': 'Ana sehifeden login sehifesine daxil ola bilmirem'
#         }

#     def test_form_with_valid_data(self):
#         form = ReviewForm(data=self.valid_data)
#         self.assertTrue(form.is_valid())

#     def test_form_with_invalid_data(self):
#             form = ReviewForm(data=self.invalid_data)
#             self.assertFalse(form.is_valid())
#             self.assertIn('name', form.errors)
#             self.assertIn('This field is required.', form.errors['name'])


#     @classmethod
#     def tearDownClass(cls):
#         pass
