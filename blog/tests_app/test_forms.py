# from django.test import TestCase

# from blog.forms import CommentForm

# class CommentFormTest(TestCase):
    

#     @classmethod
#     def setUpClass(cls):
#         cls.valid_data = {
#             "name": "Subhan",
#             "email":"subhanrzayev97@gmail.com",
#             "message":"Write this comment" 
#         }
        
#         cls.invalid_data = {
            
#             "email":"Subhan",
#             "message":"Write this comment" 
#         }

#         cls.form = CommentForm


#     def test_form_with_valid_data(self):
#         form = CommentForm(data = self.valid_data)
#         self.assertTrue(form.is_valid())

#     def test_form_with_invalid_data(self):
#         form = CommentForm(data = self.invalid_data)
#         self.assertFalse(form.is_valid())
#         self.assertIn('name',form.errors)
#         self.assertIn('email',form.errors)
#         print(form.errors)
#         self.assertIn('This field is required.', form.errors['name'])
#         self.assertIn('Enter a valid email address.', form.errors['email'])

        


#     @classmethod
#     def tearDownClass(cls):
#         pass